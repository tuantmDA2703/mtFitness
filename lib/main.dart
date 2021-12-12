import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mt_fitness/screens/onboard/onboard_page.dart';
import 'package:mt_fitness/screens/splash/splash_page.dart';
import 'package:get_it/get_it.dart';
import 'package:mt_fitness/screens/yoga_classify/yoga_classify_page.dart';
import 'package:mt_fitness/service/navigator_service.dart';
import 'base/service_locator.dart';
import 'component/app_snackbar.dart';
import 'config/app_route.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await Firebase.initializeApp();
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
      debugShowCheckedModeBanner: false,
      navigatorKey: GetIt.I<NavigatorService>().navigatorKey,
      scaffoldMessengerKey: GetIt.I<AppSnackBar>().snackBarKey,
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case AppRoute.onBoard:
            return MaterialPageRoute(builder: (context) => const OnBoardPage());
          case AppRoute.yogaClassify:
            return MaterialPageRoute(builder: (context) => const YogaPoseClassifyPage());
          default:
            return MaterialPageRoute(builder: (context) => const SplashPage());
        }
      },
      home: const SplashPage(),
    );
  }
}
