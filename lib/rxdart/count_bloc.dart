/*
 * author: Created by 李卓原 on 2018/10/30.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CountBloc {
  int _count = 0;

  var _subject = BehaviorSubject<int>();

  Stream<int> get count => _subject.stream;

  void increment() => _subject.add(++_count);

  void disposed() {
    _subject.close();
  }
}
