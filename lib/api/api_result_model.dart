import 'package:act_task/shared/utils/log_utils.dart';
import 'package:dio/dio.dart';


class APIResultModel {
  final bool success;
  final String message;
  final dynamic data;

  APIResultModel({
    required this.success,
    required this.message,
    this.data,
  });


  factory APIResultModel.fromResponse({Response? response, String? data}){
    if(response != null){
      try{
        final responseBody = response.data;
        return APIResultModel(
          success: response.statusCode == 200 || response.statusCode == 201,
          message: 'No message',
          data: responseBody,
        );
      }catch(error){
        LogUtils.log('Error in getting result from response:\n $error');
        return APIResultModel(
          success: false,
          data: null,
          message: "cannot init result api",
        );
      }
    } else {
      LogUtils.log('Response is null');
      return APIResultModel(
        success: false,
        data: null,
        message: "Response is null",
      );
    }
  }

}