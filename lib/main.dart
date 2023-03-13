import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:handler_state_app/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      
      initialRoute: '/',
      // routes: {
      //   '' : (_) => const HomeScreen(), 
      //   'custom' : (_) => const CustomScreen(), 
      // },

      getPages: [
        GetPage(name: '/', page: () =>  const HomeScreen() ),
        GetPage(name: '/custom', page: () =>  const CustomScreen() ),
      ],
      
    );

  }
}