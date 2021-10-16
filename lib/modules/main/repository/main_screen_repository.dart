import 'package:act_task/api/api.dart';
import 'package:act_task/modules/main/models/post.dart';
import 'package:act_task/modules/main/models/user.dart';

class MainScreenRepository {
  Future<List<User>> getUsers() async {
    final res = await API.getUsers();
    if (res.success) {
      final users = res.data as List<dynamic>;
      return users.map((user) => User.fromJson(user)).toList();
    }
    else {
      return [];
    }
  }

  Future<List<Post>> getPosts() async {
    final res = await API.getPosts();
    if (res.success) {
      final posts = res.data as List<dynamic>;
      return posts.map((post) => Post.fromJson(post)).toList();
    }
    else {
      return [];
    }
  }

}