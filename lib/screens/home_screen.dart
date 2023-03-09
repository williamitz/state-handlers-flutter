import 'package:flutter/material.dart';
import 'package:handler_state_app/models/user.model.dart';
import 'package:handler_state_app/providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // final jobs = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];

    final userPro = UserProvider();

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
          
              Container(
                padding: const EdgeInsets.all(20),
                child: StreamBuilder(
                  stream: userPro.userStream,
                  builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {

                    if( !snapshot.hasData ) {
                      return Text(
                        'Usuario no especificado',
                        style: Theme.of(context).textTheme.displayMedium,
                      );
                    }

                    return Column(
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
                          title: Text('Nombre: ${ snapshot.data!.name }'),
                          leading: const Icon( Icons.person ),
                        ),
                  
                        ListTile(
                          title: Text('Edad: ${ snapshot.data!.years }'),
                          leading: const Icon( Icons.timelapse ),
                        ),
                  
                        ListTile(
                          title: Text('Email: ${ snapshot.data!.email }'),
                          leading: const Icon( Icons.mail_outline ),
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
              
                        ...snapshot.data!.jobs.map((e) => ListTile(
                          title: Text( e ),
                          leading: const Icon( Icons.circle ),
                        )).toList()
                  
                      ],
                  
                    );

                  },
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