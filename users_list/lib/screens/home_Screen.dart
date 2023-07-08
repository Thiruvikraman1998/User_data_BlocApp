import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/bloc/user_bloc/user_bloc.dart';
import 'package:users_list/bloc/user_bloc/user_event.dart';
import 'package:users_list/bloc/user_bloc/user_state.dart';
import 'package:users_list/models/user_model.dart';
import 'package:users_list/repositories/fetchdata_repo.dart';
import 'package:users_list/screens/user_detail_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UsersRepository>(context),
      )..add(UserLoadingEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
          centerTitle: true,
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is UserLoadedState) {
              List<ListUserModel> userList = state.users;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                UserDetailScreen(user: userList[index]),
                          ),
                        );
                      },
                      leading: Hero(
                        tag: 'avatar${userList[index].id}',
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(userList[index]
                                  .avatar ??
                              "https://st4.depositphotos.com/4329009/19956/v/600/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg"),
                        ),
                      ),
                      title: Text(userList[index].firstName ?? 'First name'),
                      subtitle: Text(userList[index].lastName ?? 'Last Name'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              );
            } else if (state is UserErrorState) {
              return const Center(
                child: Text("Error fetching user"),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
