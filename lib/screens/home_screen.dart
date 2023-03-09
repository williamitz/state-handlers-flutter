import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // final jobs = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];

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
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
              
                    Text(
                      'Info del usuario',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                      ),
                    ),
              
                    ListTile(
                      title: Text('Nombre: '),
                      leading: Icon( Icons.person ),
                    ),
              
                    ListTile(
                      title: Text('Edad: '),
                      leading: Icon( Icons.timelapse ),
                    ),
              
                    ListTile(
                      title: Text('Email: '),
                      leading: Icon( Icons.mail_outline ),
                    ),
              
                    SizedBox(height: 20,),
              
                    Text(
                      'Trabajos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                      ),
                    ),
              
                    ListTile(
                      title: Text('Trabajo n1 '),
                      leading: Icon( Icons.circle ),
                    ),
              
                    ListTile(
                      title: Text('Trabajo n2 '),
                      leading: Icon( Icons.circle ),
                    ),
          
                    // ...jobs.map((e) => const ListTile(
                    //   title: Text('Trabajo n3'),
                    //   leading: Icon( Icons.circle ),
                    // )).toList()
              
                  ],
              
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