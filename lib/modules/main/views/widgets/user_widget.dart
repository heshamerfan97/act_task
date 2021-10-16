import 'package:act_task/modules/main/models/user.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  const UserWidget(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        child: ListTile(
          onTap: (){},
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(user.userName),
          subtitle: Text('${user.email}\nPhone: ${user.phone}\nWebsite: ${user.website}'),
          trailing: Text(user.company.name),
        ),
      ),
    );
  }
}
