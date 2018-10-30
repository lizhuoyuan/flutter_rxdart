/*
 * author: Created by 李卓原 on 2018/10/30.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ThemeChangeBloc {
  bool _isNight = false;

  var _subject = BehaviorSubject<bool>();

  Stream<bool> get isNight => _subject.stream;

  void increment(bool value) => _subject.add(_isNight = value);

  void disposed() {
    _subject.close();
  }
}
