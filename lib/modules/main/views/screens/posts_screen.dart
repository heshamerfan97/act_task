import 'package:act_task/modules/main/view_models/posts_bloc/posts_bloc.dart';
import 'package:act_task/modules/main/views/widgets/loading_widget.dart';
import 'package:act_task/modules/main/views/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        if (state is PostsLoading) {
          return const LoadingWidget();
        }
        if (state is PostsLoaded) {
          return ListView.builder(
            itemBuilder: (ctx, index) => PostWidget(state.posts[index]),
            itemCount: state.posts.length,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
