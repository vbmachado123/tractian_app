import 'package:tractian_app/app/modules/splash/splash_page.dart';
import 'package:tractian_app/app/modules/splash/splash_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  static const route = '/splash';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage()),
  ];
}
