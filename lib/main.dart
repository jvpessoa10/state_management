import 'package:flutter/material.dart';
import 'package:inherited_widget_example/provider/ChangeNotifierProviderHome.dart';
import 'package:inherited_widget_example/provider/SimpleProviderHome.dart';
import 'package:inherited_widget_example/inherited_widgets/MyHomePage2.dart';

import 'blocs/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Widget Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProviderHome(title: 'Inherited Widget Example'),
    );
  }
}