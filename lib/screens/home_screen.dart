import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:handler_state_app/providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // final jobs = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
    final userProv = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              const _TitleHome(),

              if( userProv.getUser != null )
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                
                      const Text(
                        'Info del usuario',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                
                      ListTile(
                        title: Text('Nombre: ${ userProv.getUser?.name }'),
                        leading: Icon( Icons.person ),
                      ),
                
                      ListTile(
                        title: Text('Edad: ${ userProv.getUser?.years }'),
                        leading: Icon( Icons.timelapse ),
                      ),
                
                      ListTile(
                        title: Text('Email: ${ userProv.getUser?.email }'),
                        leading: Icon( Icons.mail_outline ),
                      ),
                
                      const SizedBox(height: 20,),
                
                      const Text(
                        'Trabajos',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                
                      // ListTile(
                      //   title: Text('Trabajo n1 '),
                      //   leading: Icon( Icons.circle ),
                      // ),
                
                      // ListTile(
                      //   title: Text('Trabajo n2 '),
                      //   leading: Icon( Icons.circle ),
                      // ),
                    
                      ...userProv.getUser!.jobs.map((e) => const ListTile(
                        title: Text('Trabajo n3'),
                        leading: Icon( Icons.circle ),
                      )).toList()
                
                    ],
                
                  ),
                )

              else Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Usuario no especificado',
                  style: Theme.of(context).textTheme.headline5,
                ),
              )

            ],
          
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('custom'),
        child: const Icon( Icons.emoji_people_outlined ),
      ),
      
    );
  }
}

class _TitleHome extends StatelessWidget {
  const _TitleHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
              'Manejadores de estado',
              style: Theme.of(context).textTheme.headline4,
            ),

            Text(
              'Singleton',
              style: Theme.of(context).textTheme.headline4,
            ),
        ],
      ),
    );
  }
}