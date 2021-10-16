import 'dart:async';

import 'package:act_task/modules/main/models/post.dart';
import 'package:act_task/modules/main/repository/main_screen_repository.dart';
import 'package:act_task/shared/utils/log_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial());

  MainScreenRepository mainScreenRepository = MainScreenRepository();

  List<Post> posts = [];

  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    if(event is OnLoadPosts){
      yield PostsLoading();
      try{
        posts = await mainScreenRepository.getPosts();
      }catch(e){
        LogUtils.log(e.toString(), 'Error in getting posts');
      }
      yield PostsLoaded(posts);
    }
  }
}
