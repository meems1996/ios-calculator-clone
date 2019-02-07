// import the Material package to be used for the design
import 'package:flutter/material.dart';

// the main constructor running the app
void main() => runApp(new Calculator());

// Stateless Widget class for the app
class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '',
      home: new Calc(),
    );
  }
}

// StatefulWudget class for the app
class Calc extends StatefulWidget {
  CalcState createState() => CalcState();
}

// UI set up in this CalcState class
class CalcState extends State<Calc> {
  dynamic text = '0';
  int one = 0;
  int two = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  // button widget
  Widget buttons(btnValue, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: new RaisedButton(
        child: Text(
          btnValue,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        onPressed: () {
          calculation(btnValue);
        },
        color: color,
        padding: EdgeInsets.all(22.0),
        shape: CircleBorder(),
      ),
    );
  } // end of the button widget

  //  0 button widget
  Widget zeroButton(btnValue, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: new RaisedButton(
        child: Text(
          btnValue,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        onPressed: () {
          calculation(btnValue);
        },
        color: color,
        padding: EdgeInsets.only(top: 20, bottom: 20, right: 85, left: 85),
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
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 60.0),
                  textAlign: TextAlign.right,
                ),
              ) //stretches to the whole streen
            ],
          ),
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
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buttons('4', const Color(0xff333333)),
              buttons('5', const Color(0xff333333)),
              buttons('6', const Color(0xff333333)),
              buttons('-', Colors.orange),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buttons('1', const Color(0xff333333)),
              buttons('2', const Color(0xff333333)),
              buttons('3', const Color(0xff333333)),
              buttons('+', Colors.orange),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              zeroButton('0', const Color(0xff333333)),
              buttons('.', const Color(0xff333333)),
              buttons('=', Colors.orange),
            ],
          )
        ],
      ),
    );
  }

  void calculation(btnValue) {
    if (btnValue == 'C') {
      text = '0';
      one = 0;
      two = 0;

      result = '';
      finalResult = '';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnValue == '=') {
      if (preOpr == '+') {
        finalResult = add();
      }
    }
    else if (btnValue == '+' || btnValue == '-' || btnValue == '*' || btnValue == '/' || btnValue == '=') {
      if (one == 0) {
        one = int.parse(result);
      } else {
        two = int.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      }

      preOpr = opr;
      opr = btnValue;
      result = '';
    }
    else {
      result = result + btnValue;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (one + two).toString();
    one = int.parse(result);
    return result;
    
  }
}
