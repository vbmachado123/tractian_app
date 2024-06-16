import 'package:event_bus/event_bus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_app/app/modules/splash/splash_module.dart';
import 'package:tractian_app/app/modules/start/company_list/company_list_page.dart';
import 'package:tractian_app/app/modules/start/start_module.dart';
import 'package:tractian_app/app/modules/start/start_service.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => EventBus()),
    Bind.singleton((i) => StartService(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(SplashModule.route, module: SplashModule()),
    ModuleRoute(StartModule.route, module: StartModule()),
    ChildRoute(StartModule.list_route, child: (_, args) => CompanyListPage(companyId: args.data)),
  ];
}
