import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handler_state_app/bloc/user/user_cubit.dart';
import 'package:handler_state_app/models/user.model.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    );

    const textButtonStyle = TextStyle( color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20 );

    final userProv = BlocProvider.of<UserCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            
            if( state is UserInitial ) {
              return const Text('Página 2');
            }

            if( state is UserLoaded ) {
              return Text( state.usuario.name );
            }

            return Container();

          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            TextButton(
              onPressed: () {
                userProv.setUser( User(
                  id: '49e8r4gerg', 
                  name: 'Fulanito De Tal', 
                  email: 'fulanix@gmail.com', 
                  years: 29, 
                  jobs: ['Fullstack Developer', 'System Engenier']
                ) );
              }, 
              style: buttonStyle,
              child: const Text(
                'Establecer usuario',
                style: textButtonStyle,
              )
            ),

            TextButton(
              onPressed: () {
                userProv.setYears(30);
              }, 
              style: buttonStyle,
              child: const Text(
                'Cambiar edad',
                style: textButtonStyle,
              )
            ),

            TextButton(
              onPressed: () {
                userProv.clearUser();
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