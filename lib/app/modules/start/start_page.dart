import 'dart:developer';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_app/app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:tractian_app/app/core/app_fonts.dart';
import 'package:tractian_app/app/modules/start/start_controller.dart';
import 'package:tractian_app/app/modules/start/start_module.dart';
import 'package:tractian_app/app/shared/widgets/tv_layout_column.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key? key, this.title = 'StartPage'}) : super(key: key);
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends ModularState<StartPage, StartController> {
  @override
  void initState() {
    super.initState();
    controller.onInitState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TvLayoutColumn(
        backgroundColor: AppColors.white0,
        usePadding: false,
        children: [
          Container(
            width: double.maxFinite,
            color: AppColors.black0,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Center(
              child: Text(
                "TRACTIAN",
                style: AppFonts.h4_bold_white,
              ),
            ),
          ),
          Observer(
            builder: (_) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.companies.length,
                  itemBuilder: (context, index) {
                    final company = controller.companies[index];
                    return ListTile(
                      title: InkWell(
                        onTap: () => controller.selectCompanyAndNavigate(index),
                        child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 32,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                            color: AppColors.blue0,
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 12),
                                child: Icon(
                                  Icons.now_widgets_outlined,
                                  color: AppColors.white0,
                                  size: 30,
                                ),
                              ),
                              Text(
                                '${company.name} Unit',
                                style: AppFonts.p_bold.merge(const TextStyle(
                                  color: AppColors.white0,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Container()
        ],
      ),
    );
  }
}
