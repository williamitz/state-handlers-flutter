import 'package:get/get.dart';
import 'package:handler_state_app/models/user.model.dart';

class UserController extends GetxController {
  
  var haveUser = false.obs;

  var user = User(name: '', email: '', years: 0, jobs: []).obs;

  set setUser( User val ) {

    haveUser.value = true;
    user.value = val;

  }

  set setYears( int newYears ) {

    user.update((val) {
      val!.years = newYears;
    });

  }

  void clear() {

    haveUser.value = false;

  }

}