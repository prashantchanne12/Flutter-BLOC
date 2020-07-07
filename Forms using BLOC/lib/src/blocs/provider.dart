import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}

// Inherited widget has the own copy of bloc and this bloc is made available to login screen
// and every widget underneath it.
// context - provides information about widget. It tells where widget is located in entire widget tree
// inheritFromWidgetOfExactType - looks progressively higher and higher of our widget hierarchy until it found
// widget of exact type and that type is Provider
