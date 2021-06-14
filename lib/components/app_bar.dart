import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransparentAppBar extends StatelessWidget {
  const TransparentAppBar({Key? key, this.title}) : super(key: key);
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
