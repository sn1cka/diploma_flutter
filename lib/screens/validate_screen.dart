import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValidateScreen extends StatefulWidget {
  ValidateScreen({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  _ValidateScreenState createState() => _ValidateScreenState();
}

class _ValidateScreenState extends State<ValidateScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TransparentAppBar(),
            TextField(
              controller: widget.controller,
              maxLength: 4,
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: SizedBox.fromSize(
                  size: Size(1.sw, 50.h),
                  child: (ElevatedButton(
                    onPressed: () async {
                      await Future.delayed(Duration(milliseconds: 1500));
                      if (widget.controller.text == '5676') {
                        openNewScreen(LoginScreen(), context, needReplace: true);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Неверно введен код')));
                      }
                    },
                    child: Text('Подтвердить'),
                  )),
                ))
          ],
        ),
      ),
    ));
  }
}
