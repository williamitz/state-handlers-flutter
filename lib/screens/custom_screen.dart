import 'dart:math';

import 'package:flutter/material.dart';
import 'package:handler_state_app/models/user.model.dart';
import 'package:handler_state_app/providers/user_provider.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    );

    const textButtonStyle = TextStyle( color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20 );

    final userPro = UserProvider();

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userPro.userStream,
          initialData: userPro.getuser,
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {

            return snapshot.hasData 
              ? Text(snapshot.data!.name)
              : const Text('Página 2');

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
                userPro.user = User(
                  id: 'scrory', 
                  name: 'Fulanito de tal', 
                  email: 'fulanix@gmail.com', 
                  years: 29, 
                  jobs: ['Fullstack javascript', 'System Engenier']
                );
              }, 
              style: buttonStyle,
              child: const Text(
                'Establecer usuario',
                style: textButtonStyle,
              )
            ),

            TextButton(
              onPressed: () => userPro.yearsOld = Random().nextInt(30) + 18, 
              style: buttonStyle,
              child: const Text(
                'Cambiar edad',
                style: textButtonStyle,
              )
            ),

            TextButton(
              onPressed: () => userPro.clearUser(), 
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