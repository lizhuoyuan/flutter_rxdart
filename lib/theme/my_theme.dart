/*
 * author: Created by 李卓原 on 2018/10/30.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'package:flutter/material.dart';

class MyTheme {
  ThemeData darkTheme = ThemeData(
      backgroundColor: Colors.black,
      primaryColor: Colors.black,
      brightness: Brightness.dark);

  ThemeData lightTheme = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: Colors.green,
      primarySwatch: Colors.blue,
      brightness: Brightness.light);
}
