import 'package:flutter/material.dart';
import 'package:users_list/models/user_model.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key, required this.user});
  final ListUserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Detail"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: 'avatar${user.id}',
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(user.avatar ??
                        "https://st4.depositphotos.com/4329009/19956/v/600/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
