import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(onPressed: () {}, child: Text('Вход'))),
          Padding(
              padding: EdgeInsets.all(20),
              child:
                  ElevatedButton(onPressed: () {}, child: Text('Регистрация'))),
        ],
      ),
    ));
  }
}
