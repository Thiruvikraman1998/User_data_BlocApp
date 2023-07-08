import 'package:users_list/bloc/user_bloc/user_event.dart';
import 'package:users_list/bloc/user_bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/fetchdata_repo.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository _usersRepository;
  int page = 0;

  UserBloc(this._usersRepository) : super(UserLoadingState()) {
    on<UserLoadingEvent>(
      (event, emit) async {
        emit(UserLoadingState());
        try {
          page++;
          final users = await _usersRepository.fetchUsers(page);
          emit(UserLoadedState(users));
        } catch (e) {
          emit(UserErrorState(e.toString()));
        }
      },
    );
  }
}
