// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:handler_state_app/models/user.model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  UserCubit() : super( UserInitial() );

  void setUser( User val ) {
    emit( UserLoaded( val ) );
  }

  void setYears( int val ) {

    final currentState = state;

    if( currentState is UserLoaded ) {

      final newUser = currentState.usuario.copyWith( years: val );
      emit( UserLoaded( newUser ) );

    }

  }

  void clearUser() {
    emit( UserInitial() );
  }

}
