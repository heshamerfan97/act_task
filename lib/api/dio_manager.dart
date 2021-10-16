import 'package:act_task/shared/utils/log_utils.dart';
import 'package:dio/dio.dart';

class DIOManger {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  static Map<String, String> getHeader() {
    return {
      "Content-Type": "application/json",
    };
  }

  static Dio dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/', headers: getHeader()));


  ///POST Method
  static Future<Response?> post({
    String? baseUrl,
    required String path,
    required Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dio.post(path, data: body);
      LogUtils.log(response.data.toString(), 'Response of posting to ${baseUrl ?? _baseUrl + path}');
      return response;
    } catch (error) {
      LogUtils.log('Error in ${baseUrl ?? _baseUrl + path}:\n $error');
      return null;
    }
  }

  ///GET Method
  static Future<Response?> get({
    String? baseUrl,
    required String path,
    required Map<String, dynamic>? parameters,
  }) async {
    try {
      final response = await dio.get(path, queryParameters: parameters);
      LogUtils.log(response.data.toString(), 'Response of getting ${baseUrl ?? _baseUrl + path}');
      return response;
    } catch (error) {
      LogUtils.log('Error in getting ${baseUrl ?? _baseUrl + path}:\n $error');
      return null;
    }
  }

}
