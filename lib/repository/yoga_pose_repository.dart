import 'package:mt_fitness/response/classify_reponse.dart';

abstract class YogaPoseRepository{
  Future<ClassifyResponse?> requestClassify(String data);
}