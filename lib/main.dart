import 'package:flutter/material.dart';
import 'package:handler_state_app/providers/user_provider.dart';
import 'package:handler_state_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(

  MultiProvider(
    providers: [
      ChangeNotifierProvider( create: ( _ ) => UserProvider() )
    ],
    child: MyApp(),
  )

);

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