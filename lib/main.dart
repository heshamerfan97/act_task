import 'package:act_task/app_bloc.dart';
import 'package:act_task/config/routes.dart';
import 'package:act_task/modules/main/view_models/posts_bloc/posts_bloc.dart';
import 'package:act_task/modules/main/view_models/users_bloc/users_bloc.dart';
import 'package:act_task/modules/main/views/screens/main_screen.dart';
import 'package:act_task/shared/service/my_navigator.dart';
import 'package:act_task/shared/utils/log_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    LogUtils.log('BLOC EVENT', event);
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    LogUtils.log('BLOC ERROR', error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    LogUtils.log('BLOC TRANSITION', transition);
    super.onTransition(bloc, transition);
  }
}


void main() async {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    AppBloc.usersBloc.add(OnLoadUsers());
    AppBloc.postsBloc.add(OnLoadPosts());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: MaterialApp(
            navigatorKey: MyNavigator.navigatorKey,
            onGenerateRoute: AppRouter.generateRoute,
            home: const MainScreen(),
          ),
    );
  }

  @override
  void dispose() {
    AppBloc.dispose();
    super.dispose();
  }
}