import 'package:flutter/material.dart';

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
        title: const Text('Página 2'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            TextButton(
              onPressed: () {
                
              }, 
              style: buttonStyle,
              child: const Text(
                'Establecer usuario',
                style: textButtonStyle,
              )
            ),

            TextButton(
              onPressed: () {
                
              }, 
              style: buttonStyle,
              child: const Text(
                'Cambiar edad',
                style: textButtonStyle,
              )
            ),

            TextButton(
              onPressed: () {
                
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