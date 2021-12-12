import 'package:get_it/get_it.dart';
import 'package:mt_fitness/repository/yoga_pose_repository_impl.dart';
import 'package:mt_fitness/service/navigator_service.dart';

void setupServiceLocator(){
  GetIt getIt = GetIt.I;
  getIt.registerLazySingleton<YogaPoseRepositoryImpl>(() => YogaPoseRepositoryImpl());
  getIt.registerLazySingleton<NavigatorService>(() => NavigatorService());
}