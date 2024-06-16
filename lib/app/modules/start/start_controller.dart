import 'dart:convert';
import 'dart:developer';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tractian_app/app/modules/start/model/tree_node_model.dart';
import 'package:tractian_app/app/modules/start/start_module.dart';
import 'package:tractian_app/app/modules/start/start_service.dart';
import 'package:tractian_app/app/shared/models/asset_model.dart';
import 'package:tractian_app/app/shared/models/company_model.dart';
import 'package:tractian_app/app/shared/models/local_model.dart';

part 'start_controller.g.dart';

class StartController = _StartControllerBase with _$StartController;

abstract class _StartControllerBase with Store {
  final EventBus _eventBus;
  final StartService _service;

  @observable
  bool isLoading = false;

  @observable
  String companySelected = "";

  @observable
  ObservableList<CompanyModel> companies = ObservableList();

  @observable
  ObservableList<LocalModel> locations = ObservableList();

  @observable
  ObservableList<AssetModel> assets = ObservableList();

  @observable
  ObservableList<TreeNode> treeData = ObservableList<TreeNode>();

  @observable
  ObservableList<TreeNode> filteredData = ObservableList<TreeNode>();

  @observable
  ObservableList<TreeNode> backupData = ObservableList<TreeNode>();

  @observable
  String searchTerm = '';

  @observable
  bool filterEnergySensors = false;

  @observable
  bool filterCriticalStatus = false;

  final searchInputController = TextEditingController();

  _StartControllerBase(this._eventBus, this._service);

  @action
  onInitState() {
    companies.clear();
    companies.addAll(_service.companies);
  }

  @action
  selectCompanyAndNavigate(int index) {
    companySelected = companies.elementAt(index).id!;
    Modular.to.popAndPushNamed(StartModule.list_route, arguments: companySelected);
  }

  @action
  getCompanyData(String companyId) async {
    companySelected = companyId;
    try {
      isLoading = true;
      _clearCompanyData();
      await _getCompanyData();
      treeData = ObservableList.of(buildTree(locations, assets));
      filteredData.addAll(treeData);
      backupData.clear();
      backupData.addAll(filteredData);
    } finally {
      isLoading = false;
    }
  }

  @action
  toggleNodeExpansion(TreeNode node) {
    final index = treeData.indexOf(node);

    node.isExpanded = !node.isExpanded;
    log("Expanded: ${node.isExpanded}");
  }

  Future<void> _getCompanyData() async {
    locations.addAll(await _service.getLocations(companySelected));
    assets.addAll(await _service.getAssets(companySelected));
  }

  void _clearCompanyData() {
    locations.clear();
    assets.clear();
  }

  Iterable<TreeNode> buildTree(ObservableList<LocalModel> locations, ObservableList<AssetModel> assets) {
    ObservableList<TreeNode> treeData = ObservableList();

    final locationsForRoot = locations.where((location) => location.parentId == null);
    locationsForRoot.forEach((location) {
      treeData.add(TreeNode.fromLocal(location));
    });

    final componentsForRoot =
        assets.where((asset) => asset.parentId == null && asset.locationId == null && validateIfIsComponent(asset));
    componentsForRoot.forEach((asset) {
      treeData.add(TreeNode.fromAsset(asset));
    });

    treeData.forEach((element) => element.isFirst = true);

    void addChildren(TreeNode node) {
      log("> Add Children for: ${node.id ?? ""}");

      final assetsByLocation = assets.where((asset) => asset.locationId == node.id);
      assetsByLocation.forEach((asset) {
        log("> Add Asset: ${asset.id}");
        TreeNode assetNode = TreeNode.fromAsset(asset);
        node.children.add(assetNode);

        final componentsByAsset = assets.where((component) => component.parentId == asset.id);
        componentsByAsset.forEach((component) {
          log("> Add Asset: ${component.id}");
          assetNode.children.add(TreeNode.fromAsset(component));
        });
      });

      final childLocations = locations.where((location) => location.parentId == node.id);
      childLocations.forEach((location) {
        log("> Add ChildLocations: ${location.id}");
        TreeNode locationNode = TreeNode.fromLocal(location);
        node.children.add(locationNode);
        addChildren(locationNode);
      });
    }

    treeData.forEach((node) {
      addChildren(node);
    });

    log("> Root Locations ${treeData.length}");
    log("> FullData ${jsonEncode(treeData)}");

    return treeData;
  }

  @action
  filterNodesByEnergySensors() {
    if (filterEnergySensors) {
      filteredData.clear();
      filteredData.addAll(_filterNodesByEnergySensors(treeData));
    } else {
      filteredData.clear();
      filteredData.addAll(treeData);
    }
  }

  Iterable<TreeNode> _filterNodesByEnergySensors(Iterable<TreeNode> nodes) {
    List<TreeNode> filteredNodes = [];

    for (var node in nodes) {
      if (_nodeMatchesEnergySensorCriteria(node)) {
        filteredNodes.add(node.copyWith(
          children: _filterNodesByEnergySensors(node.children).toList(),
        ));
      }
    }

    return filteredNodes;
  }

  bool _nodeMatchesEnergySensorCriteria(TreeNode node) {
    return node.sensorType == "energy";
  }

  @action
  filterNodesByCriticalStatus() {
    if (filterCriticalStatus) {
      filteredData.clear();
      filteredData.addAll(_filterNodesByCriticalStatus(treeData));
    } else {
      filteredData.clear();
      filteredData.addAll(treeData);
    }
  }

  Iterable<TreeNode> _filterNodesByCriticalStatus(Iterable<TreeNode> nodes) {
    List<TreeNode> filteredNodes = [];

    for (var node in nodes) {
      if (_nodeMatchesCriticalStatusCriteria(node)) {
        filteredNodes.add(node.copyWith(
          children: _filterNodesByCriticalStatus(node.children).toList(),
        ));
      }
    }

    return filteredNodes;
  }

  bool _nodeMatchesCriticalStatusCriteria(TreeNode node) {
    return node.status != null;
  }

  Iterable<TreeNode> _filterNodesByName(Iterable<TreeNode> nodes, String term) {
    log("Filtrando itens para: ${term}");
    List<TreeNode> filteredNodes = [];

    for (var node in nodes) {
      if (node.name.toLowerCase().contains(term)) {
        filteredNodes.add(node);
      }

      if (node.children.isNotEmpty) {
        var filteredChildren = _filterNodesByName(node.children, term);
        if (filteredChildren.isNotEmpty) {
          filteredNodes.add(TreeNode(
            id: node.id,
            name: node.name,
            children: filteredChildren.toList(),
          ));
        }
      }
    }

    return filteredNodes;
  }

  validateIfIsComponent(AssetModel asset) {
    return asset.sensorId != null && asset.status != null;
  }

  @action
  filterNodesBySearchTerm() {
    final term = searchInputController.text.trim().toLowerCase();
    if (term.isNotEmpty) {
      searchTerm = term;
      filteredData.clear();
      filteredData.addAll(_filterNodesByName(treeData, term));
    } else {
      searchTerm = '';
      filteredData.clear();
      filteredData.addAll(treeData);
    }
  }

  @computed
  Iterable<TreeNode> get filteredTreeData {
    Iterable<TreeNode> result = treeData;

    if (searchTerm.isNotEmpty) {
      result = _filterNodesByName(result, searchTerm.toLowerCase());
    }

    if (filterEnergySensors) {
      result = _filterNodesByEnergySensors(result);
    }

    if (filterCriticalStatus) {
      result = _filterNodesByCriticalStatus(result);
    }

    return result;
  }

  @computed
  bool get isFilter => filteredData.isNotEmpty;
}
