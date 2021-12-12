import 'package:get_it/get_it.dart';
import 'package:mt_fitness/component/app_snackbar.dart';
import 'package:mt_fitness/repository/firebase_repository_impl.dart';
import 'package:mt_fitness/repository/yoga_pose_repository_impl.dart';
import 'package:mt_fitness/service/firebase_service.dart';
import 'package:mt_fitness/service/navigator_service.dart';

import 'network_client.dart';

void setupServiceLocator(){
  GetIt getIt = GetIt.I;
  getIt.registerLazySingleton<YogaPoseRepositoryImpl>(() => YogaPoseRepositoryImpl());
  getIt.registerLazySingleton<FirebaseRepositoryImpl>(() => FirebaseRepositoryImpl());
  getIt.registerLazySingleton<NavigatorService>(() => NavigatorService());
  getIt.registerLazySingleton<AppSnackBar>(() => AppSnackBar());
  getIt.registerLazySingleton<NetworkClient>(() => NetworkClient());
  getIt.registerLazySingleton<FirebaseService>(() => FirebaseService());
}