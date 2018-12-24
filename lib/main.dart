import 'package:flutter/material.dart';
import 'package:basiccalc/MainContent.dart';

//main method gets instance of myApp
main() => runApp(MyApp());

//represents the application
class MyApp extends StatelessWidget{

  //the main widget in the app
  var _mainContent;

  //constructor gets new instance of main content
  MyApp(){
    _mainContent = new MainContent();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator',
        home: Scaffold(
          appBar: AppBar(
              title: Text('Basic Calc')
          ),
          body: _mainContent,

        )
    );
  }

}
