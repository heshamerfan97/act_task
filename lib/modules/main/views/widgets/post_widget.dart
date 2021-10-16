import 'package:act_task/app_bloc.dart';
import 'package:act_task/modules/main/models/post.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget(this.post, {Key? key}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child : Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () => _showAuthor(context),
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(post.title),
            subtitle: Text(post.body),
          ),
        ),
      ),
    );
  }

  _showAuthor(BuildContext context) => showDialog(context: context, builder: (ctx) => Dialog(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: AppBloc.usersBloc.users.firstWhere((user) => user.id == post.userId).userName,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const TextSpan(
              text: ' is the author of this post',
              style: TextStyle(color: Colors.black),
            )
          ]
        ),
      ),
    ),
  ));
}
