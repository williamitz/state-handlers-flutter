part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {
  final haveUser = false;
}


class UserLoaded extends UserState {

  final haveUser = true;

  final User _usuario;

  UserLoaded(this._usuario);

  User get usuario => _usuario;

}
