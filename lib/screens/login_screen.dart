import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Войдите в приложение'),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var login = 'sn1cka';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20), child: TextField()),
          Padding(padding: EdgeInsets.all(20), child: TextField()),
          ElevatedButton(onPressed: () {}, child: Text('LOGIN'))
        ],
      ),
    );
  }
}
