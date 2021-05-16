import 'package:flutter/material.dart';
import 'package:flutter_app/screens/detailed_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/registration_screen.dart';
import 'package:flutter_app/screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
          onPressed: () => openNewScreen(RegistrationScreen()),
          child: Text('Registration')),
      ElevatedButton(
          onPressed: () => openNewScreen(StartScreen()),
          child: Text('Start screen')),
      ElevatedButton(
          onPressed: () => openNewScreen(LoginScreen()),
          child: Text('Login Screen')),
      ElevatedButton(
          onPressed: () => openNewScreen(DetailedScreen()),
          child: Text('Detailed'))
    ]);
  }

  void openNewScreen(Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }
}
