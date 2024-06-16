import 'package:event_bus/event_bus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tractian_app/app/modules/splash/events/get_companies_event.dart';
import 'package:tractian_app/app/modules/start/start_module.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final EventBus _eventBus;

  _SplashControllerBase(this._eventBus);

  @action
  onInitState() {
    _eventBus.fire(GetCompaniesEvent());
    Future.delayed(const Duration(seconds: 3)).then((value) => Modular.to.popAndPushNamed(StartModule.route));
  }
}
