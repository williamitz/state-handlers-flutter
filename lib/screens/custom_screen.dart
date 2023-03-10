import 'package:flutter/material.dart';
import 'package:handler_state_app/models/user.model.dart';
import 'package:provider/provider.dart';

import 'package:handler_state_app/providers/user_provider.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    );

    const textButtonStyle = TextStyle( color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20 );

    final userProv = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: userProv.getUser == null 
          ? const Text('Página 2')
          : Text( userProv.getUser!.name ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextButton(
              onPressed: () => userProv.setUser = User(
                id: 'xd', 
                name: 'Fulanito de tal', 
                email: 'fulanix@gmail.com', 
                years: 29, 
                jobs: ['Fullstack developer', 'System Engenier']
              ), 
              style: buttonStyle,
              child: const Text(
                'Establecer usuario',
                style: textButtonStyle,
              )
            ),

            TextButton(
              onPressed: () => userProv.setYear = 30, 
              style: buttonStyle,
              child: const Text(
                'Cambiar edad',
                style: textButtonStyle,
              )
            ),

            TextButton(
              onPressed: () => userProv.clear(), 
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