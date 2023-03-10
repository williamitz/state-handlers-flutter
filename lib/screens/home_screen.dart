import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handler_state_app/bloc/user/user_cubit.dart';
import 'package:handler_state_app/models/user.model.dart';

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
          
              BlocBuilder<UserCubit, UserState>(
                builder: ( context, state ) {

                  if( state is UserInitial ) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Usuario no especificado',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    );
                  }

                  if( state is UserLoaded ) {
                    return _UserDetail( user: state.usuario, );
                  }

                  return Container();

                },
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

class _UserDetail extends StatelessWidget {

  final User user;

  const _UserDetail({
    Key? key, required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
            title: Text('Nombre: ${ user.name }'),
            leading: Icon( Icons.person ),
          ),
    
          ListTile(
            title: Text('Edad: ${ user.years }'),
            leading: Icon( Icons.timelapse ),
          ),
    
          ListTile(
            title: Text('Email: ${ user.email }'),
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
          
          ...user.jobs.map((e) => ListTile(
            title: Text( e ),
            leading: const Icon( Icons.circle ),
          )).toList()
    
        ],
    
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