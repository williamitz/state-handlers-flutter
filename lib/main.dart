import 'package:flutter/material.dart';
import 'package:handler_state_app/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      
      initialRoute: '',
      routes: {
        '' : (_) => const HomeScreen(), 
        'custom' : (_) => const CustomScreen(), 
      },
    );

  }
}