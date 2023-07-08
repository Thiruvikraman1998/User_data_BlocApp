import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserLoadingEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}
