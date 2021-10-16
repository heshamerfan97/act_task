import 'dart:async';

import 'package:act_task/modules/main/models/user.dart';
import 'package:act_task/modules/main/repository/main_screen_repository.dart';
import 'package:act_task/shared/utils/log_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial());

  MainScreenRepository mainScreenRepository = MainScreenRepository();

  List<User> users = [];

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    if (event is OnLoadUsers) {
      yield UsersLoading();
      try {
        users = await mainScreenRepository.getUsers();
      } catch (e) {
        LogUtils.log(e.toString(), 'Error in getting users');
      }
      yield UsersLoaded(users);
    }
    if (event is OnSearchForUser) {
      yield UsersLoading();
      if(event.text.isEmpty) {
        yield UsersLoaded(users);
      }
      else {
        final filteredUser = users.where((user) =>
            user.userName.toLowerCase().contains(event.text.toLowerCase())).toList();
        yield UsersLoaded(filteredUser);
      }
    }
  }
}
