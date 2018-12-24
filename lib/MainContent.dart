import 'package:flutter/material.dart';


//The main content
class MainContent extends StatefulWidget{
  @override
  _MyState createState() => _MyState();

}

//state of main content
class _MyState extends State<MainContent>{
  //stores first number to be used
  double _firstnum ;
  //stores second number
  double _secondnum;
  //stores the operation sign
  String _operation;
  //stores the answer
  double _ans;
  //if first number has been entered
  bool _firstDone;
  //if all fields have been entered
  bool _all ;
  //if operation sign has been entered
  bool  _opDone;

  //initiliaze all fields when constructed
  _MyState(){
    _firstnum =0 ;
    _secondnum =0;
     _operation="+";
    _ans=0;
    _firstDone=false;
     _all=false;
    _opDone=false;
  }

  //action done when number button is pressed
  void _setNumber(double n){
    setState(() {
      //check if first number not entered
      if(!_firstDone){
        _firstnum = n;
        _firstDone = true;
      }else if(_opDone){ //if operation entered set second number
        _secondnum = n;
        _all = true;
      }
    });
  }

  //clears all fields
  void _clearAll(){
    setState(() {
      _ans = 0;
      _firstnum =0;
      _secondnum=0;
      _all = false;
      _firstDone=false;
      _opDone=false;
    });
  }

  //set the operation to be used
  void _setOperation(String op){
     setState(() {
       if(_firstDone){
         _operation = op;
         _opDone=true;
       }
     });
  }

  //when calculate button pressed
  void  _calculate() {
        setState(() {
      //choose and execute operation
      if(_all){
         switch(_operation){
           case "+":
             _ans = _firstnum + _secondnum;
             break;
           case "-":
             _ans = _firstnum-_secondnum;
             break;
           case "/":
             _ans = _firstnum / _secondnum;
             break;
           case "x":
             _ans = _firstnum * _secondnum;
             break;
           default:
             break;
         }
        //clear all fields
        _firstDone=false;
         _all=false;
         _opDone=false;
      }
    });
  }


  //creates a button widget to be used
  Widget _button (String number, Function() f){ // Creating a method of return type Widget with number and function f as a parameter
    return MaterialButton(
      minWidth: 70,
      height: 60,
      child: Text(number,
          style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      textColor: Colors.black,
      splashColor: Colors.green,
      color: Colors.blue,
      onPressed: f,
    );
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.black26,
       body: Column(
         children: <Widget>[
            Container(
               padding: EdgeInsets.only(right: 30,top: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: <Widget>[
                   Column(
                     children: <Widget>[
                       Text('$_firstnum',style: TextStyle(fontSize:50,fontWeight: FontWeight.bold)),
                       Text('$_operation',style: TextStyle(fontSize:50,fontWeight: FontWeight.bold)),
                       Text('$_secondnum',style: TextStyle(fontSize:50,fontWeight: FontWeight.bold)),
                     ],
                   )
                 ],
               ),
            ),
            Text((_ans == 0 ?"":'Ans: $_ans'),style: TextStyle(fontSize:50,fontWeight: FontWeight.bold))
           ,ColumnSpacer(
              spacing: 5,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _button("C", _clearAll), // using custom widget _button
                    _button("%",(){ _setOperation("%");}),
                    _button("0", (){_setNumber(0);}),
                    _button("/", (){_setOperation("/");})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _button("7", (){_setNumber(7);}), // using custom widget _button
                    _button("8",(){_setNumber(8);}),
                    _button("9",(){_setNumber(9);}),
                    _button("x", (){_setOperation("x");})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _button("4", (){_setNumber(4);}), // using custom widget _button
                    _button("5", (){_setNumber(5);}),
                    _button("6", (){_setNumber(6);}),
                    _button("+", (){_setOperation("+");})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _button("1", (){_setNumber(1);}), // using custom widget _button
                    _button("2",(){_setNumber(2);}),
                    _button("3",(){_setNumber(3);}),
                    _button("-", (){_setOperation("-");})
                  ],
                ),
                Container(
                   padding: EdgeInsets.only(left: 10,right: 10),
                   child:  RaisedButton(
                     child: Text('='),
                     color: Colors.blue,
                     splashColor: Colors.green,
                     onPressed: (){_calculate();},
                   ),
                )
              ],
            )
         ],

       ),
     );
  }
}


///Spaces items in a column
class ColumnSpacer extends StatelessWidget {
  final List<Widget> children;
  final double spacing;

  ColumnSpacer({this.children, this.spacing});

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children
          .map((c) => Container(
        padding: EdgeInsets.only(bottom: spacing),
        child: c,
      ))
          .toList(),
    );
  }
}