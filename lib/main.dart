import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mt_fitness/screens/onboard/onboard_page.dart';
import 'package:mt_fitness/screens/splash/splash_page.dart';
import 'package:get_it/get_it.dart';
import 'package:mt_fitness/service/navigator_service.dart';
import 'base/service_locator.dart';
import 'config/app_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MtFitnessApp());
}

class MtFitnessApp extends StatelessWidget {
  const MtFitnessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GetIt.I<NavigatorService>().navigatorKey,
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case AppRoute.onBoard:
            return MaterialPageRoute(builder: (context) => const OnBoardPage());
          default:
            return MaterialPageRoute(builder: (context) => const SplashPage());
        }
      },
      home: const SplashPage(),
    );
  }
}
