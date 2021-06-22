import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_caller.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/screens/main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: LoginForms(),
      ),
    );
  }
}

class LoginForms extends StatefulWidget {
  const LoginForms({Key? key}) : super(key: key);

  @override
  _LoginFormsState createState() => _LoginFormsState();
}

class _LoginFormsState extends State<LoginForms> {
  var login = '';
  var password = '';
  var isLoading = false;
  final apiCaller = RestClient(Dio());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TransparentAppBar(),
          Padding(
              padding: EdgeInsets.all(16.w),
              child: Text(
                'Вход',
                style: TextStyle(
                  fontSize: 34.sp,
                ),
              )),
          Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    createForm(
                        labelText: 'Email*',
                        onChanged: (value) {
                          login = value;
                        },
                        validator: (value) {
                          if (login.isEmpty) return 'Введите логин';
                        },
                        type: TextInputType.name),
                    createForm(
                        labelText: 'Пароль*',
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (password.isEmpty) return 'Введите пароль';

                        },
                        type: TextInputType.visiblePassword),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.w),
                      child: SizedBox.fromSize(
                        size: Size(1.sw, 50.w),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (!isLoading && _formKey.currentState!.validate()) {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(content: Text('Выполняется вход')));
                              auth();
                            }
                          },
                          child: isLoading? CircularProgressIndicator(): Text(
                            'Далее',
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        child: SizedBox.fromSize(
                          size: Size(1.sw, 50.w),
                          child: (ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Отмена'),
                          )),
                        ))
                  ])),
        ]),
      ),
    );
  }

  void auth() {
    setState(() {
      isLoading = true;
    });
    apiCaller.createToken(login, password).then((value) {
      if (value.accessToken != null) {
        Hive.box('MyBox').put('isAuthorized', true);
        Hive.box('MyBox').put('token', value.accessToken);
        openNewScreen(MainScreen(), context, needReplace: true);
        setState(() {
          isLoading = false;
        });
      } else
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.detail ?? 'Неверные данные для авторизации')));
    }, onError: (error, stackTrace){
      setState(() {
        isLoading = false;
      });
      print(error);
      print(stackTrace);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Неверные данные для авторизации')));
    });
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
      ),
    );
  }
}
