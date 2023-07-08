import 'package:flutter/material.dart';
import 'package:users_list/models/user_model.dart';

import '../screens/user_detail_screen.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key, required this.users});
  final ListUserModel users;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 100,
      width: double.infinity,
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UserDetailScreen(user: users),
            ),
          );
        },
        leading: Hero(
          tag: 'avatar${users.id}',
          child: CircleAvatar(
            backgroundImage: NetworkImage(users.avatar ??
                "https://st4.depositphotos.com/4329009/19956/v/600/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg"),
          ),
        ),
        title: Text(users.firstName ?? 'First name'),
        subtitle: Text(users.lastName ?? 'Last Name'),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
