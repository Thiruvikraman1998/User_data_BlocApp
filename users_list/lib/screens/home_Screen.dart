import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/bloc/user_bloc/user_bloc.dart';
import 'package:users_list/bloc/user_bloc/user_event.dart';
import 'package:users_list/bloc/user_bloc/user_state.dart';
import 'package:users_list/models/user_model.dart';
import 'package:users_list/repositories/fetchdata_repo.dart';
import 'package:users_list/widgets/list_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  var _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
  }

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
                physics: BouncingScrollPhysics(),
                //controller: _scrollController,
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return UserListTile(users: userList[index]);
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
