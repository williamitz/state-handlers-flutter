part of 'user_bloc.dart';

@immutable
abstract class UserState {

  final bool haveUser;
  final User? user;

  const UserState({this.haveUser = false, this.user});

}

class UserInitialState extends UserState {}

class LoadUserState extends UserState {
  
  final User user;

  const LoadUserState(this.user): super( haveUser: true, user: user );

}
