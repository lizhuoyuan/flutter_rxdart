/*
 * author: Created by 李卓原 on 2018/10/30.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_state/rxdart/count_bloc.dart';
import 'package:flutter_state/rxdart/theme_change_bloc.dart';

class BlocProvider extends InheritedWidget {
  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  final countBloc = CountBloc();
  final themeChangeBloc = ThemeChangeBloc();

  static CountBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
          .countBloc;

  static ThemeChangeBloc ofTheme(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
          .themeChangeBloc;
}
