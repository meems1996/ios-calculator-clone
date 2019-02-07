import 'package:flutter/material.dart';

void main() => runApp(new Calculator());

class Calculator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '',
      home: new Calc(),
    );
  }
}

class Calc extends StatefulWidget {
  CalcState createState() => CalcState();
}

class CalcState extends State<Calc> {

  // button widget
   Widget buttons(btnValue, Color color) {
     return Container(
       padding: EdgeInsets.only(bottom: 10.0),
       child: new RaisedButton(
         child: Text(btnValue,
         style: TextStyle(
           fontSize: 30,
           color: Colors.white
         ),),
         onPressed: (){},
         color: color,
         padding: EdgeInsets.all(22.0),
         shape: CircleBorder(),
       ),
     );
   } // end of the button widget

   //  0 button widget
   Widget zeroButton (btnValue, Color color) {
     return Container(
       padding: EdgeInsets.only(bottom: 10.0),
       child: new RaisedButton(
         child: Text(btnValue,
         style: TextStyle(
           fontSize: 30,
           color: Colors.white
         ),),
         onPressed: (){},
         color: color,
         padding: EdgeInsets.only(top: 20,bottom: 20, right: 85, left: 85),
         shape: StadiumBorder(),
       ),
     );
   } // end of the button widget

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: null,
     backgroundColor: Colors.black,
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
        //  first row of the app
         Row(children: <Widget>[
           Expanded(
             child: Text(
               '123',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 60.0
               ),
               textAlign: TextAlign.right,
             ),
           ) //stretches to the whole streen
         ],),
        // second row of the app 
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
         buttons('C', const Color(0xffa5a5a5)),
         buttons('+/-', const Color(0xffa5a5a5)),
         buttons('%', const Color(0xffa5a5a5)),
         buttons('/', Colors.orange),
       ],
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
         buttons('7', const Color(0xff333333)),
         buttons('8', const Color(0xff333333)),
         buttons('9', const Color(0xff333333)),
         buttons('X', Colors.orange),
       ],),

       Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
         buttons('4', const Color(0xff333333)),
         buttons('5', const Color(0xff333333)),
         buttons('6', const Color(0xff333333)),
         buttons('-', Colors.orange),
       ],),

       Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
         buttons('1', const Color(0xff333333)),
         buttons('2', const Color(0xff333333)),
         buttons('3', const Color(0xff333333)),
         buttons('+', Colors.orange),
       ],),

       Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
         zeroButton('0', const Color(0xff333333)),
         buttons('.', const Color(0xff333333)),
         buttons('=', Colors.orange),
       ],)
       ],
     ),
   );
  }
}