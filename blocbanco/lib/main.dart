import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocexample/screens/cadastro.dart';
import 'package:blocexample/screens/login.dart';
import 'package:blocexample/screens/home.dart';
import 'package:blocexample/screens/profile.dart';
import 'package:blocexample/screens/tela1.dart';
import 'package:blocexample/screens/tela2.dart';

import 'bloc/manage_bloc.dart';
import 'bloc/monitor_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Stateful Clicker Counter',
      theme: ThemeData(
        // Application theme data, you can set the colors for the application as
        // you want
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Clicker Counter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*
  var _currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _currentScreen,
        children: [
          Cadastro(),
          Login(),
          Home(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.app_registration_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarms_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.login)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle)),
        ],
        currentIndex: _currentScreen,
        onTap: (int novoItem) {
          setState(() {
            _currentScreen = novoItem;
          });
        },
        fixedColor: Colors.purple,
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(widget.title),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.app_registration_rounded)),
                  Tab(icon: Icon(Icons.login)),
                  Tab(icon: Icon(Icons.account_circle)),
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
                Cadastro(),
                Login(),
                Home(),
                Profile(),
                //Tela1(),
                //Tela2(),
              ],
            ),
          )),
    );
  }
}
