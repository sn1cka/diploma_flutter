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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          TransparentAppBar(),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
                    child: Text(
                      'Проверьте свою почту и активируйте учетную запись',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34.sp,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                  child: SizedBox.fromSize(
                    size: Size(1.sw, 50.h),
                    child: ElevatedButton(
                      onPressed: () {
                        openNewScreen(LoginScreen(), context, needReplace: true);
                      },
                      child: Text('Войти'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
