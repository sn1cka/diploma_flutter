import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/api/api_caller.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/screens/validate_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import '../main.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String? login;
  String? email;
  String? password;
  String? repeatPassword;
  String? name;
  var getEmails = false;
  var isValidated = false;
  var apiCaller = RestClient(Dio());

  final logger = Logger(level: Level.verbose);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: isValidated
            ? Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                TransparentAppBar(),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
                    child: Text(
                      'Регистрация',
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
                              initialValue: name,
                              labelText: 'Имя*',
                              onChanged: (value) {
                                name = value;
                              },
                              validator: (value) {
                                if (name == null || repeatPassword!.isEmpty) {
                                  return 'Введите имя';
                                }
                              }),
                          createForm(
                              initialValue: login,
                              labelText: 'Логин*',
                              onChanged: (value) {
                                login = value;
                              },
                              validator: (value) {
                                if (login == null || login!.isEmpty)
                                  return 'Введите имя';
                              },
                              type: TextInputType.name),
                          createForm(
                              initialValue: email,
                              labelText: 'Email*',
                              onChanged: (value) {
                                email = value;
                              },
                              validator: (value) {
                                if (email == null || email!.isEmpty)
                                  return 'Введите почту';
                                else if (!email!.contains('@')) {
                                  return 'Введите существующий адрес';
                                }
                              },
                              type: TextInputType.emailAddress),
                          createForm(
                              initialValue: password,
                              labelText: 'Пароль*',
                              onChanged: (value) {
                                password = value;
                              },
                              validator: (value) {
                                if (password == null || password!.isEmpty)
                                  return 'Введите пароль';
                                else if (password!.length < 6) {
                                  return 'Длина пароля должна быть не менее 6 символов';
                                }
                              },
                              type: TextInputType.visiblePassword),
                          createForm(
                              initialValue: repeatPassword,
                              labelText: 'Повторите пароль*',
                              onChanged: (value) {
                                repeatPassword = value;
                              },
                              validator: (value) {
                                if (repeatPassword == null ||
                                    repeatPassword!.isEmpty) {
                                  return 'Введите пароль';
                                }
                                if (password != repeatPassword) {
                                  return 'Пароли не совпадают';
                                }
                              }),
                          // Padding(
                          //     padding: EdgeInsets.fromLTRB(8.w, 8.h, 0, 40.h),
                          //     child: CheckboxListTile(
                          //       contentPadding: EdgeInsets.zero,
                          //       controlAffinity: ListTileControlAffinity.leading,
                          //       title: Text('Я хочу получать Email рассылку'),
                          //       onChanged: (bool? value) {
                          //         setState(() {
                          //           getEmails = value!;
                          //         });
                          //       },
                          //       value: getEmails,
                          //     )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 16.w),
                            child: SizedBox.fromSize(
                              size: Size(1.sw, 50.h),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      isValidated = true;
                                      toConfirmPage();
                                    });
                                  }
                                },
                                child: Text(
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
                                size: Size(1.sw, 50.h),
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

  Widget createForm(
      {required String? labelText,
      required Function(String) onChanged,
      required String? Function(String?) validator,
      required String? initialValue,
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
          controller: TextEditingController(text: initialValue),
          onChanged: onChanged,
          keyboardType: type,
          validator: validator,
        ));
  }

  void toConfirmPage() async {
    await apiCaller.createUser(email!, login!, password!, name!).then(
      (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value)));
        logger.i(value);
        openNewScreen(ValidateScreen(), context);
      },
    ).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          logger.e(
              "Got error : ${res!.statusCode} -> ${res.statusMessage} ${res.data}");
          if (res.statusCode != null && res.statusCode == 400) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(res.data)));
          }

          break;
        default:
      }
    });
    setState(() {
      isValidated = false;
    });
  }
}
