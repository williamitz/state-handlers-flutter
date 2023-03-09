import 'dart:async';

import 'package:handler_state_app/models/user.model.dart';

class UserProvider {

  static final UserProvider _instance = UserProvider._();

  UserProvider._();

  factory UserProvider() {
    return _instance;
  }

  User? _user;

  final StreamController<User?> _userStreamCtrl = StreamController<User?>.broadcast();

  Stream<User?> get userStream => _userStreamCtrl.stream;

  set user( User val ) {
    _user = val;
    _userStreamCtrl.sink.add( val );
  }

  User? get getuser => _user;

  set yearsOld( int val ) {
    _user!.years = val;
    _userStreamCtrl.sink.add( _user );
  }

  void clearUser() {
    _user = null;
    _userStreamCtrl.sink.add( _user );
  }

  void dispose() {
    _userStreamCtrl.close();
  }

}

// final userProvider = UserProvider();
