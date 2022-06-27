import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/manage_bloc.dart';
import '../bloc/monitor_bloc.dart';
import 'add_note.dart';
import 'list_node.dart';
import 'login_screen.dart';

import 'home.dart';
import 'profile.dart';
import 'criadores.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

import 'cadastro.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Erro do Firebase"),
                  content: Text(state.message),
                );
              });
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(Logout());
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNote(),
                        ));*/
                  },
                  //child: const Icon(Icons.logout)),
                  child: const Icon(Icons.add_rounded)),
              appBar: AppBar(
                  // Here we take the value from the MyHomePage object that was created by
                  // the App.build method, and use it to set our appbar title.
                  title: const Text("RepArt"),
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.home)),
                      Tab(icon: Icon(Icons.add_rounded)),
                      Tab(icon: Icon(Icons.account_circle)),
                    ],
                  )),
              body: MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => ManageBloc()),
                  BlocProvider(create: (_) => MonitorBloc()),
                ],
                child: TabBarView(
                  children: [
                    //Home(),
                    ListNote(),
                    AddNote(),
                    Profile(),
                  ],
                ),
              ),
              drawer: Drawer(
                child: ListView(
                  children: [
                    /*const DrawerHeader(
                child: Text("RepArt"),
              ),*/
                    UserAccountsDrawerHeader(
                      accountEmail: Text('ulisses@gmail.com'),
                      accountName: Text('Ulisses'),
                      currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage('https://i7.pngguru.com/preview/633/903/703/hey-you-pikachu-pokemon-go-ash-ketchum-pikachu.jpg')),
                    ),
                    ListTile(
                      title: const Text("Criadores"),
                      leading: Icon(Icons.account_circle),
                      onTap: () {
                        setState(() {
                          Criadores();
                          //_currentScreen = 4;
                          Navigator.pop(context);
                        });
                      },
                    ),
                    ListTile(
                      title: const Text("Logout"),
                      leading: Icon(Icons.exit_to_app),
                      onTap: () {
                        BlocProvider.of<AuthBloc>(context).add(Logout());
                        setState(() {
                          //_currentScreen = 4;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return //LoginScreen();
              DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    body: const TabBarView(
                      children: [
                        RegisterScreen(),
                        LoginScreen()
                      ],
                    ),
                    appBar: AppBar(
                      title: const Text("RepArt"),
                      bottom: const TabBar(
                        tabs: [
                          Tab(text: "Cadastro"),
                          Tab(text: "Efetuar Login")
                        ],
                      ),
                    ),
                  ));
        }
      },
    );
  }
}
