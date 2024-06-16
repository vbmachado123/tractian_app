import 'package:event_bus/event_bus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_app/app/modules/splash/splash_controller.dart';

void main() {
  late SplashController store;

  setUpAll(() {
    store = SplashController(EventBus());
  });

  test('increment count', () async {});
}
