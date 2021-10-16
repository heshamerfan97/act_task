import 'package:act_task/api/api_result_model.dart';
import 'package:act_task/api/dio_manager.dart';
import 'package:act_task/shared/utils/log_utils.dart';

class API {

  ///User
  static const String users = "users";

  ///Posts
  static const String posts = "posts";




  ///User APIs
  static Future<APIResultModel> getUsers({Map<String, dynamic>? parameters}) async {
    LogUtils.log(parameters.toString(), 'Parameters Sent');
    return APIResultModel.fromResponse(
        response: await DIOManger.get(path: users, parameters: parameters),
        data: null);
  }


  ///Posts APIs
  static Future<APIResultModel> getPosts({Map<String, dynamic>? parameters}) async {
    LogUtils.log(parameters.toString(), 'Parameters Sent');
    return APIResultModel.fromResponse(
        response: await DIOManger.get(path: posts, parameters: parameters),
        data: null);
  }

}
