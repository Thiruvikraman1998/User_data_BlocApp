import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:users_list/models/user_model.dart';

@immutable
abstract class UserState extends Equatable {}

// loading state
class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

//loaded state
class UserLoadedState extends UserState {
  final List<ListUserModel> users;

  UserLoadedState(this.users);

  @override
  List<Object?> get props => [users];
}

//Error State
class UserErrorState extends UserState {
  final String error;

  UserErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
