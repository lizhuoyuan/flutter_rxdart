import 'package:flutter/material.dart';
import 'package:flutter_state/page/my_homepage.dart';
import 'package:flutter_state/rxdart/bolc_provider.dart';
import 'package:flutter_state/rxdart/count_bloc.dart';
import 'package:flutter_state/theme/my_theme.dart';

void main() => runApp(BlocProvider(child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.ofTheme(context);
    return StreamBuilder(
      builder: _builder,
      initialData: false,
      stream: themeBloc.isNight,
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot snapshot) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: snapshot.data ? MyTheme().darkTheme : MyTheme().lightTheme,
      home: new MyHomePage(title: 'Home Page, ${snapshot.data.toString()}'),
    );
  }
}
