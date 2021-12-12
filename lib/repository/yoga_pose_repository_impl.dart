import 'package:mt_fitness/base/network_client.dart';
import 'package:mt_fitness/config/app_config.dart';
import 'package:mt_fitness/repository/yoga_pose_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mt_fitness/response/classify_reponse.dart';

class YogaPoseRepositoryImpl implements YogaPoseRepository {
  var dio = GetIt.I<NetworkClient>().instance;

  @override
  Future<ClassifyResponse?> requestClassify(String data) async {
    dio.options.headers['Authorization'] = 'Bearer ${AppConfig.nyckelToken}';
    dio.options.headers['Content-Type'] = 'application/json';
    try {
      var response = await dio.post(
          'https://www.nyckel.com/v1/functions/8jdoo31m41a2lltv/invoke',
          data: {'data': data});
      if (response.statusCode == 200) {
        ClassifyResponse classifyResponse =
            ClassifyResponse.fromJson(Map<String, dynamic>.from(response.data));
        return classifyResponse;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
