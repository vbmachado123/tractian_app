import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_app/app/core/app_colors.dart';
import 'package:tractian_app/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ModularState<SplashPage, SplashController> {
  final SplashController store = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.onInitState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white0,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(),
          Image.asset(
            "assets/logo.png",
            height: 80,
          ),
          CircularProgressIndicator(
            color: AppColors.blue0,
            strokeWidth: 5,
          ),
        ]),
      ),
    );
  }
}
