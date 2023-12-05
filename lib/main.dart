import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String tes = '0';
  String res = '';
  String txt = '';
  double f = 0;
  double l = 0;
  String op = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculator',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Container(
            //  margin: EdgeInsets.zero,
            padding: EdgeInsets.all(0),
            //color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      tes,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                Row(
                  children: [
                    buildExpanded('0'),
                    buildExpanded('1'),
                    buildExpanded('2'),
                    buildExpanded('3'),
                  ],
                ),
                Row(
                  children: [
                    buildExpanded('4'),
                    buildExpanded('5'),
                    buildExpanded('6'),
                    buildExpanded('7'),
                  ],
                ),
                Row(
                  children: [
                    buildExpanded('8'),
                    buildExpanded('9'),
                    buildExpanded('0'),
                    buildExpanded('+'),
                  ],
                ),
                Row(
                  children: [
                    buildExpanded('-'),
                    buildExpanded('*'),
                    buildExpanded('/'),
                    buildExpanded('='),
                  ],
                ),
                Row(
                  children: [
                    buildFlexible1('AC'),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Expanded buildFlexible1(String s) {
    return Expanded(
      child: Container(
        color: Colors.cyan,
        width: double.infinity,
        height: 100,
        //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        padding: EdgeInsets.all(15),
        child: TextButton(
          onPressed: () {
            if (s == 'AC') {
              setState(() {
                tes = '';
                res = '';
              });
            }
          },
          child: Text(
            s,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          style: TextButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(20)),
        ),
      ),
    );
  }

  Expanded buildExpanded(String v) {
    return Expanded(
        child: Container(
      //alignment: Alignment.bottomRight,
      // padding: EdgeInsets.all(),
      child: TextButton(
        onPressed: () {
          if (v == '+' || v == '-' || v == '*' || v == '/') {
            f = double.parse(res);
            res = '';
            op = v;
            // res = f.toString() + op;
            print('first:' + f.toString());
            print('operation:' + op);
          } else if (v == '=') {
            l = double.parse(res);
            if (op == '+') {
              res = (l + f).toString();
            }
            if (op == '-') {
              res = (l - f).toString();
            }
            if (op == '*') {
              res = (l * f).toString();
            }
            if (op == '/') {
              res = (f / l).toString();
            }
          } else {
            tes = v;
            res += tes;
          }
          setState(() {
            tes = res;
          });
        },
        child: Text(
          v,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        style: TextButton.styleFrom(
            //backgroundColor: Colors.yellow,
            //shape: CircleBorder(),
            padding: EdgeInsets.all(15)),
      ),
    ));
  }
}
