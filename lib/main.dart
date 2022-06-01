import 'package:flutter/material.dart';
import 'package:responsiveness/view/big_view.dart';
import 'package:responsiveness/view/medium_view.dart';
import 'package:responsiveness/view/small_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Responsiveness',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600 ) {
          return const SmallView();
        } 
        if (constraints.maxWidth > 900){
          return const BigView();
        } else {
          return MediumView();
        }
        
      },
    );
  }
}
