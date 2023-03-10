import 'package:flutter/cupertino.dart';
import 'package:handler_state_app/models/user.model.dart';

class UserProvider with ChangeNotifier {
  
  User? _user;

  set setUser( User val ) {
    _user = val;
    notifyListeners();
  }

  User? get getUser => _user;

  set setYear( int val ) {
    _user?.years = val;
    notifyListeners();
  }

  void clear() {
    _user = null;
    notifyListeners();
  }

}