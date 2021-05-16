import 'package:flutter/material.dart';
import 'package:flutter_app/screens/main_screen.dart';
import 'package:flutter_app/screens/registration_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        'img/splash.png',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
      Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                        (route) => false);
                  },
                  child: Text('Вход'))),
          Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 48),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegistrationScreen(),
                    ));
                  },
                  child: Text('Регистрация'))),
        ],
      )),
    ]));
  }
}
