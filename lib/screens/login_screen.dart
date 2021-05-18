import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: LoginForms(),
    );
  }
}

class LoginForms extends StatefulWidget {
  const LoginForms({Key? key}) : super(key: key);

  @override
  _LoginFormsState createState() => _LoginFormsState();
}

class _LoginFormsState extends State<LoginForms> {
  var email = '';
  var password = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Вход',
            style: TextStyle(
              fontSize: 34.sp,
            ),
          )),
      Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            createForm(
                labelText: 'Email*',
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (email.isEmpty) return 'Введите почту';
                  if (!email.contains('@')) {
                    return 'Введите существующий адрес';
                  }
                },
                type: TextInputType.emailAddress),
            createForm(
                labelText: 'Пароль*',
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (password.isEmpty) return 'Введите пароль';
                  if (password.length < 6) {
                    return 'Длина пароля должна быть не менее 6 символов';
                  }
                },
                type: TextInputType.visiblePassword),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: SizedBox.fromSize(
                    size: Size(1.sw, 50.w),
                    child: ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.validate();
                      },
                      child: Text(
                        'Далее',
                        textAlign: TextAlign.start,
                      ),
                    ))),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: SizedBox.fromSize(
                    size: Size(1.sw, 50.w),
                    child: (ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Отмена'),
                    ))))
          ])),
    ])));
  }

  Widget createForm(
      {required String labelText,
      required Function(String) onChanged,
      required String? Function(String?) validator,
      TextInputType type = TextInputType.text}) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: TextFormField(
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(),
              disabledBorder: InputBorder.none,
              labelText: labelText),
          controller: TextEditingController(),
          onChanged: onChanged,
          keyboardType: type,
          validator: validator,
        ));
  }
}
