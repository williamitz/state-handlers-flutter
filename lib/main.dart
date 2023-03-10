import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handler_state_app/providers/user/user_bloc.dart';
import 'package:handler_state_app/screens/screens.dart';

void main() => runApp(

  MultiBlocProvider(
    providers: [
      BlocProvider(create: ( _ ) => UserBloc(),)
    ], 
    child: MyApp()
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