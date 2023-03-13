import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handler_state_app/controllers/user_controller.dart';
import 'package:handler_state_app/models/user.model.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    );

    const textButtonStyle = TextStyle( color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20 );

    final args = Get.arguments;

    final userCtrl = Get.find<UserController>();

    print('arguments ::: $args');

    return Scaffold(
      appBar: AppBar(
        title: Obx( 
          () => !userCtrl.haveUser.value 
            ? const Text('Página 2')
            : Text( userCtrl.user.value.name ) , 
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
                userCtrl.setUser = User(
                  name: 'Fulanito de tal', 
                  email: 'fulanix@gmail.com', 
                  years: 29, 
                  jobs: ['Developer Fullstack', 'Gamer Streaming']
                );

                Get.snackbar(
                  'Mensaje al usuario', 
                  'Usuario seleccionado Fulanito de Tal',
                  backgroundColor: Colors.white,
                  boxShadows: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black38
                    )
                  ]
                );
              }, 
              style: buttonStyle,
              child: const Text(
                'Establecer usuario',
                style: textButtonStyle,
              )
            ),

            TextButton(
              onPressed: () {
                final newYears = Random().nextInt(15) + 18;
                userCtrl.setYears = newYears;

                print('newYears ::: $newYears');
              }, 
              style: buttonStyle,
              child: const Text(
                'Cambiar edad',
                style: textButtonStyle,
              )
            ),

            TextButton(
              onPressed: () {
                userCtrl.clear();
              }, 
              style: buttonStyle,
              child: const Text(
                'Limpiar',
                style: textButtonStyle,
              )
            ),

            TextButton(
              onPressed: () {
                Get.changeTheme( Get.isDarkMode ? ThemeData.light() : ThemeData.dark() );
              }, 
              style: buttonStyle,
              child: const Text(
                'Cambiar tema',
                style: textButtonStyle,
              )
            ),


          ],
        ),
      ),
    );
  }
}