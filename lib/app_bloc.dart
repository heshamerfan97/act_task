import 'package:act_task/modules/main/view_models/posts_bloc/posts_bloc.dart';
import 'package:act_task/modules/main/view_models/users_bloc/users_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc {
  static final usersBloc = UsersBloc();
  static final postsBloc = PostsBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<UsersBloc>(
      create: (context) => usersBloc,
    ),
    BlocProvider<PostsBloc>(
      create: (context) => postsBloc,
    ),
  ];

  static void dispose() {
    usersBloc.close();
    postsBloc.close();
  }

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
