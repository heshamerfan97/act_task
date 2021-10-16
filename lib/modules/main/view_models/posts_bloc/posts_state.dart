part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}
class PostsLoading extends PostsState {}
class PostsLoaded extends PostsState {
  final List<Post> posts;

  PostsLoaded(this.posts);
}
