import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_app/app/modules/start/company_list/company_list_page.dart';
import 'package:tractian_app/app/modules/start/start_controller.dart';
import 'package:tractian_app/app/modules/start/start_page.dart';

class StartModule extends Module {
  static const route = '/start';
  static const list_route = '/list';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StartController(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => StartPage()),
    ChildRoute(list_route, child: (_, args) => CompanyListPage(companyId: args.data)),
  ];
}
