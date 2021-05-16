import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  var name = '';
  var email = '';
  var password = '';
  var getEmails = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Center(
                child: Column(
      children: [
        Text('Регистрация'),
        Padding(padding: EdgeInsets.all(16), child: TextField()),
        Padding(padding: EdgeInsets.all(16), child: TextField()),
        Padding(padding: EdgeInsets.all(16), child: TextField()),
        Padding(padding: EdgeInsets.all(16), child: TextField()),
        Padding(
            padding: EdgeInsets.all(16),
            child: Checkbox(
              onChanged: (bool? value) {
                setState(() {
                  getEmails = value!;
                });
              },
              value: getEmails,
            )),
        Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Далее'),
            )),
        Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Отмена'),
            )),
      ],
    ))));
  }
}
