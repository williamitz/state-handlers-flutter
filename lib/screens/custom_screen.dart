import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handler_state_app/models/user.model.dart';
import 'package:handler_state_app/providers/user/user_bloc.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    );

    const textButtonStyle = TextStyle( color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20 );

    

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            
            return !state.haveUser 
              ? const Text('Página 2')
              : Text( state.user!.name );

          },
        )
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            TextButton(
              onPressed: () {

                final userProv = BlocProvider.of<UserBloc>(context, listen: false);
                
                final newUser = User(
                  id: 'f6w1f1w61', 
                  name: 'Fulanito de tal', 
                  email: 'fulanix@gmail.com', 
                  years: 29, 
                  jobs: ['Fullstack developer', 'Gammer Streaming']
                );

                userProv.add( LoadUserEvent( newUser ) );

              }, 
              style: buttonStyle,
              child: const Text(
                'Establecer usuario',
                style: textButtonStyle,
              )
            ),

            TextButton(
              onPressed: () {

                 final userProv = BlocProvider.of<UserBloc>(context, listen: false);
                
                userProv.add( SetYearsEvent( Random().nextInt( 15 ) + 18 ) );
                
              }, 
              style: buttonStyle,
              child: const Text(
                'Cambiar edad',
                style: textButtonStyle,
              )
            ),

            TextButton(
              onPressed: () {
                final userProv = BlocProvider.of<UserBloc>(context, listen: false);
                userProv.add( ClearUserEvent() );
              }, 
              style: buttonStyle,
              child: const Text(
                'Limpiar',
                style: textButtonStyle,
              )
            ),


          ],
        ),
      ),
    );
  }
}