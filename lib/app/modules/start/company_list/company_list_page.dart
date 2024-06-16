import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_app/app/core/app_colors.dart';
import 'package:tractian_app/app/core/app_fonts.dart';
import 'package:tractian_app/app/modules/start/model/tree_node_model.dart';
import 'package:tractian_app/app/modules/start/start_controller.dart';
import 'package:tractian_app/app/modules/start/start_module.dart';
import 'package:tractian_app/app/modules/start/widgets/filter_field_widget.dart';

class CompanyListPage extends StatefulWidget {
  final String companyId;
  const CompanyListPage({Key? key, required this.companyId}) : super(key: key);

  @override
  State<CompanyListPage> createState() => _CompanyListPageState();
}

class _CompanyListPageState extends ModularState<CompanyListPage, StartController> {
  @override
  void initState() {
    super.initState();
    controller.getCompanyData(widget.companyId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildTreeNode(TreeNode node) {
    return ListTile(
      title: Row(
        children: [
          buildExpandIcon(node),
          buildNodeIcon(node),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              node.name,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.h7_bold,
            ),
          ),
          buildStatus(node),
        ],
      ),
      onTap: () {
        controller.toggleNodeExpansion(node);
        setState(() {});
      },
    );
  }

  Widget buildTreeNodes(List<TreeNode> nodes) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: nodes.length,
      itemBuilder: (context, index) {
        TreeNode node = nodes[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTreeNode(node),
            if (node.isExpanded) // Mostra os filhos se o nó estiver expandido
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: buildTreeNodes(node.children),
              ),
          ],
        );
      },
    );
  }

  Widget buildStatus(TreeNode node) {
    List<Widget> items = [];

    if (node.status != null && node.status == "alert") {
      items.add(Container(
        width: 10,
        height: 10,
        margin: EdgeInsets.only(right: 5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(500)),
          color: Colors.red,
        ),
      ));
    }

    if (node.sensorType != null) {
      if (node.sensorType == "energy") {
        items.add(Icon(
          Icons.flash_on,
          size: 12,
          color: Colors.green,
        ));
      }
      if (node.sensorType == "vibration") {
        items.add(Icon(
          Icons.vibration,
          size: 12,
          color: Colors.amber,
        ));
      }
    }

    return Row(
      children: items,
    );
  }

  Widget buildExpandIcon(TreeNode node) {
    if (node.children.isNotEmpty) {
      return Observer(
        builder: (_) => IconButton(
          icon: Icon(
            node.isExpanded ? Icons.expand_more : Icons.arrow_right,
            size: 20,
          ),
          onPressed: () {
            controller.toggleNodeExpansion(node);
            setState(() {});
          },
        ),
      );
    } else {
      return SizedBox(width: !node.isFirst ? 40 : 12);
    }
  }

  Widget buildNodeIcon(TreeNode node) {
    // Verifica se o nó é um local
    bool isLocation = controller.locations.any((location) => location.id == node.id);

    // Verifica se o nó é um ativo
    bool isAsset = controller.assets.any((asset) => asset.id == node.id && asset.parentId == null);

    // Verifica se o nó é um componente
    bool isComponent = controller.assets.any(
      (asset) => asset.id == node.id && asset.parentId != null && controller.validateIfIsComponent(asset),
    );
    double iconSize = 20;
    if (isLocation) {
      return Image.asset('assets/location.png', width: iconSize, height: iconSize);
    } else if (isAsset) {
      return Image.asset('assets/asset.png', width: iconSize, height: iconSize);
    } else if (isComponent) {
      return Image.asset('assets/component.png', width: iconSize, height: iconSize);
    } else {
      return Image.asset('assets/asset.png', width: iconSize, height: iconSize);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black0,
        title: Text(
          "Assets",
          style: AppFonts.h6_bold_white,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white0,
          ),
          onPressed: () => Modular.to.popAndPushNamed(StartModule.route),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Observer(builder: (context) {
                  return TextField(
                    controller: controller.searchInputController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(
                          controller.searchInputController.text.isNotEmpty ? Icons.delete : Icons.search,
                          size: 22,
                          color: AppColors.black0,
                        ),
                        onPressed: () {
                          controller.filterNodesBySearchTerm();
                          setState(() {});
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      hoverColor: AppColors.blue0,
                      focusColor: AppColors.blue0,
                      hintText: "Buscar Ativo ou Local",
                      hintStyle: AppFonts.p_regular,
                      fillColor: AppColors.white_1,
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      alignLabelWithHint: false,
                      enabled: true,
                    ),
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(builder: (context) {
                      return FilterFieldWidget(
                          onTap: () {
                            controller.filterEnergySensors = !controller.filterEnergySensors;
                            controller.filterNodesByEnergySensors();
                            log("Energy is selected: ${controller.filterEnergySensors}");
                          },
                          icon: Icons.flash_on,
                          isSelected: controller.filterEnergySensors,
                          selectedColor: Colors.amber.shade600,
                          label: "Sensor de Energia");
                    }),
                    Observer(builder: (context) {
                      return FilterFieldWidget(
                          onTap: () {
                            controller.filterCriticalStatus = !controller.filterCriticalStatus;
                            controller.filterNodesByCriticalStatus();
                            log("Critical is selected: ${controller.filterCriticalStatus}");
                          },
                          icon: Icons.info,
                          isSelected: controller.filterCriticalStatus,
                          selectedColor: Colors.red,
                          label: "Crítico");
                    }),
                  ],
                ),
                Container(
                  width: double.maxFinite,
                  height: 1,
                  color: AppColors.black0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Observer(builder: (_) {
              return controller.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        color: AppColors.blue0,
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.filteredTreeData.length,
                      itemBuilder: (context, index) => buildTreeNodes(controller.filteredTreeData.toList()),
                    );
            }),
          ),
        ],
      ),
    );
  }
}
