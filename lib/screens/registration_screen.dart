import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
  var repeatPassword = '';
  var getEmails = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TransparentAppBar(),
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Регистрация',
                    style: TextStyle(
                      fontSize: 34.sp,
                    ),
                  )),
              Form(
                  key: _formKey,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      createForm(
                      labelText: 'Имя*',
                      onChanged: (value) {
                        name = value;
                      },
                      validator: (value) {
                        if (name.isEmpty) return 'Введите имя';
                      },
                      type: TextInputType.name),
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
                  createForm(
                      labelText: 'Повторите пароль*',
                      onChanged: (value) {
                        repeatPassword = value;
                      },
                      validator: (value) {
                        if (repeatPassword.isEmpty) {
                          return 'Введите пароль';
                        }
                        if (password != repeatPassword) {
                          return 'Пароли не совпадают';
                        }
                      }),
                  Padding(
                      padding: EdgeInsets.fromLTRB(8.w, 8.h, 0, 40.h),
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Я хочу получать Email рассылку'),
                        onChanged: (bool? value) {
                          setState(() {
                            getEmails = value!;
                          });
                        },
                        value: getEmails,
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                      child: SizedBox.fromSize(
                          size: Size(1.sw, 50.h),
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
                          size: Size(1.sw, 50.h),
                          child: (ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Отмена'),
                          ))))
                      ])),
            ])));
  }

  Widget createForm({required String labelText,
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
