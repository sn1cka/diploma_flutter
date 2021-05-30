import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransparentAppBar extends StatelessWidget {
  const TransparentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
