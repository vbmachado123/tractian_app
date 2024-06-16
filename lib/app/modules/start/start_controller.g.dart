// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StartController on _StartControllerBase, Store {
  Computed<Iterable<TreeNode>>? _$filteredTreeDataComputed;

  @override
  Iterable<TreeNode> get filteredTreeData => (_$filteredTreeDataComputed ??=
          Computed<Iterable<TreeNode>>(() => super.filteredTreeData,
              name: '_StartControllerBase.filteredTreeData'))
      .value;
  Computed<bool>? _$isFilterComputed;

  @override
  bool get isFilter =>
      (_$isFilterComputed ??= Computed<bool>(() => super.isFilter,
              name: '_StartControllerBase.isFilter'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_StartControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$companySelectedAtom =
      Atom(name: '_StartControllerBase.companySelected', context: context);

  @override
  String get companySelected {
    _$companySelectedAtom.reportRead();
    return super.companySelected;
  }

  @override
  set companySelected(String value) {
    _$companySelectedAtom.reportWrite(value, super.companySelected, () {
      super.companySelected = value;
    });
  }

  late final _$companiesAtom =
      Atom(name: '_StartControllerBase.companies', context: context);

  @override
  ObservableList<CompanyModel> get companies {
    _$companiesAtom.reportRead();
    return super.companies;
  }

  @override
  set companies(ObservableList<CompanyModel> value) {
    _$companiesAtom.reportWrite(value, super.companies, () {
      super.companies = value;
    });
  }

  late final _$locationsAtom =
      Atom(name: '_StartControllerBase.locations', context: context);

  @override
  ObservableList<LocalModel> get locations {
    _$locationsAtom.reportRead();
    return super.locations;
  }

  @override
  set locations(ObservableList<LocalModel> value) {
    _$locationsAtom.reportWrite(value, super.locations, () {
      super.locations = value;
    });
  }

  late final _$assetsAtom =
      Atom(name: '_StartControllerBase.assets', context: context);

  @override
  ObservableList<AssetModel> get assets {
    _$assetsAtom.reportRead();
    return super.assets;
  }

  @override
  set assets(ObservableList<AssetModel> value) {
    _$assetsAtom.reportWrite(value, super.assets, () {
      super.assets = value;
    });
  }

  late final _$treeDataAtom =
      Atom(name: '_StartControllerBase.treeData', context: context);

  @override
  ObservableList<TreeNode> get treeData {
    _$treeDataAtom.reportRead();
    return super.treeData;
  }

  @override
  set treeData(ObservableList<TreeNode> value) {
    _$treeDataAtom.reportWrite(value, super.treeData, () {
      super.treeData = value;
    });
  }

  late final _$filteredDataAtom =
      Atom(name: '_StartControllerBase.filteredData', context: context);

  @override
  ObservableList<TreeNode> get filteredData {
    _$filteredDataAtom.reportRead();
    return super.filteredData;
  }

  @override
  set filteredData(ObservableList<TreeNode> value) {
    _$filteredDataAtom.reportWrite(value, super.filteredData, () {
      super.filteredData = value;
    });
  }

  late final _$backupDataAtom =
      Atom(name: '_StartControllerBase.backupData', context: context);

  @override
  ObservableList<TreeNode> get backupData {
    _$backupDataAtom.reportRead();
    return super.backupData;
  }

  @override
  set backupData(ObservableList<TreeNode> value) {
    _$backupDataAtom.reportWrite(value, super.backupData, () {
      super.backupData = value;
    });
  }

  late final _$searchTermAtom =
      Atom(name: '_StartControllerBase.searchTerm', context: context);

  @override
  String get searchTerm {
    _$searchTermAtom.reportRead();
    return super.searchTerm;
  }

  @override
  set searchTerm(String value) {
    _$searchTermAtom.reportWrite(value, super.searchTerm, () {
      super.searchTerm = value;
    });
  }

  late final _$filterEnergySensorsAtom =
      Atom(name: '_StartControllerBase.filterEnergySensors', context: context);

  @override
  bool get filterEnergySensors {
    _$filterEnergySensorsAtom.reportRead();
    return super.filterEnergySensors;
  }

  @override
  set filterEnergySensors(bool value) {
    _$filterEnergySensorsAtom.reportWrite(value, super.filterEnergySensors, () {
      super.filterEnergySensors = value;
    });
  }

  late final _$filterCriticalStatusAtom =
      Atom(name: '_StartControllerBase.filterCriticalStatus', context: context);

  @override
  bool get filterCriticalStatus {
    _$filterCriticalStatusAtom.reportRead();
    return super.filterCriticalStatus;
  }

  @override
  set filterCriticalStatus(bool value) {
    _$filterCriticalStatusAtom.reportWrite(value, super.filterCriticalStatus,
        () {
      super.filterCriticalStatus = value;
    });
  }

  late final _$getCompanyDataAsyncAction =
      AsyncAction('_StartControllerBase.getCompanyData', context: context);

  @override
  Future getCompanyData(String companyId) {
    return _$getCompanyDataAsyncAction
        .run(() => super.getCompanyData(companyId));
  }

  late final _$_StartControllerBaseActionController =
      ActionController(name: '_StartControllerBase', context: context);

  @override
  dynamic onInitState() {
    final _$actionInfo = _$_StartControllerBaseActionController.startAction(
        name: '_StartControllerBase.onInitState');
    try {
      return super.onInitState();
    } finally {
      _$_StartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectCompanyAndNavigate(int index) {
    final _$actionInfo = _$_StartControllerBaseActionController.startAction(
        name: '_StartControllerBase.selectCompanyAndNavigate');
    try {
      return super.selectCompanyAndNavigate(index);
    } finally {
      _$_StartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleNodeExpansion(TreeNode node) {
    final _$actionInfo = _$_StartControllerBaseActionController.startAction(
        name: '_StartControllerBase.toggleNodeExpansion');
    try {
      return super.toggleNodeExpansion(node);
    } finally {
      _$_StartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterNodesByEnergySensors() {
    final _$actionInfo = _$_StartControllerBaseActionController.startAction(
        name: '_StartControllerBase.filterNodesByEnergySensors');
    try {
      return super.filterNodesByEnergySensors();
    } finally {
      _$_StartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterNodesByCriticalStatus() {
    final _$actionInfo = _$_StartControllerBaseActionController.startAction(
        name: '_StartControllerBase.filterNodesByCriticalStatus');
    try {
      return super.filterNodesByCriticalStatus();
    } finally {
      _$_StartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterNodesBySearchTerm() {
    final _$actionInfo = _$_StartControllerBaseActionController.startAction(
        name: '_StartControllerBase.filterNodesBySearchTerm');
    try {
      return super.filterNodesBySearchTerm();
    } finally {
      _$_StartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
companySelected: ${companySelected},
companies: ${companies},
locations: ${locations},
assets: ${assets},
treeData: ${treeData},
filteredData: ${filteredData},
backupData: ${backupData},
searchTerm: ${searchTerm},
filterEnergySensors: ${filterEnergySensors},
filterCriticalStatus: ${filterCriticalStatus},
filteredTreeData: ${filteredTreeData},
isFilter: ${isFilter}
    ''';
  }
}
