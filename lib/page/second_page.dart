/*
 * author: Created by 李卓原 on 2018/10/30.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_state/rxdart/bolc_provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countBloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: StreamBuilder(
        builder: _builder,
        stream: countBloc.count,
        initialData: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => countBloc.increment(),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot snapshot) {
    print(snapshot.data);
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'You have pushed the button this many times:',
          ),
          Text(
            snapshot.data.toString(),
            style: Theme.of(context).textTheme.display1,
          )
        ],
      ),
    );
  }
}
