import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import 'package:handler_state_app/models/user.model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super( UserInitialState() ) {

    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadUserEvent>((event, emit) {
      
      emit( LoadUserState( event.user ) );

    });

    on<SetYearsEvent>((event, emit) {
      
      if( event.years >= 18 && event.years <= 30 ) {

        if( state.user != null ) {

          final currentUser = state.user!.copyWith(years: event.years);

          emit( LoadUserState( currentUser ) );
        }

      }

    });

    on<ClearUserEvent>((event, emit) {
      
      emit( UserInitialState() );

    });

  }
}
