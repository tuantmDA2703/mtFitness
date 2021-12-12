import 'package:dio/dio.dart';
class NetworkClient{
  static BaseOptions baseOptions = BaseOptions(connectTimeout: 15000, receiveTimeout: 15000);
  final Dio instance = Dio(baseOptions);
}