/*
 * author: Created by 李卓原 on 2018/10/30.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_state/page/second_page.dart';
import 'package:flutter_state/rxdart/bolc_provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var themeBloc;
  @override
  Widget build(BuildContext context) {
    final countBloc = BlocProvider.of(context);
    themeBloc = BlocProvider.ofTheme(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              builder: _switchBuilder,
              stream: themeBloc.isNight,
              initialData: false,
            ),
            StreamBuilder(
              builder: _builder,
              stream: countBloc.count,
              initialData: 0,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(PageRouteBuilder(pageBuilder: _pageBuilder)),
        tooltip: 'Increment',
        child: new Icon(Icons.arrow_forward),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot snapshot) {
    return new Text(
      snapshot.data.toString(),
      style: Theme.of(context).textTheme.display1,
    );
  }

  Widget _pageBuilder(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SecondPage();
  }

  Widget _switchBuilder(BuildContext context, AsyncSnapshot<bool> snapshot) {
    return Switch(value: snapshot.data, onChanged: _onchange);
  }

  void _onchange(bool value) {
    themeBloc.increment(value);
  }
}
