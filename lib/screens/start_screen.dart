import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/registration_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'img/splash.png',
              fit: BoxFit.fill,
              width: 1.sw,
              height: 1.sh,
            ),
            Positioned(
              top: 300.h,
              left: 20.w,
              right: 20.w,
              child: FittedBox(
                child: Column(
                  children: [
                    Text('Discover',
                        style: TextStyle(fontSize: 71.sp, color: Colors.white)),
                    Text('Kyrgyzstan',
                        style: TextStyle(fontSize: 71.sp, color: Colors.white))
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.all(16.w),
                      child: SizedBox.fromSize(
                        size: Size(1.sw, 50.w),
                        child: ElevatedButton(
                          onPressed: () {
                            openNewScreen(LoginScreen(), context);
                          },
                          child: Text('Вход'),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 8.w, 16.w, 48.w),
                      child: SizedBox.fromSize(
                        size: Size(1.sw, 50.w),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RegistrationScreen(),
                              ),
                            );
                          },
                          child: Text('Регистрация'),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
