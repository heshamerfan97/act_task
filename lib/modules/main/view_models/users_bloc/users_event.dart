part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class OnLoadUsers extends UsersEvent {}
class OnSearchForUser extends UsersEvent {
  final String text;

  OnSearchForUser(this.text);
}
