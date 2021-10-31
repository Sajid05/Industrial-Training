import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _msg1 = "Expand";
  String _msg3 = "Expand";
  String _msg2 = "Gimme Cake!";

  bool _isButton1Expanded = false;
  bool _isButton2Activated = false;
  bool _isButton3Expanded = false;

  int _button1Flex = 1;
  int _button2Flex = 1;
  int _button3Flex = 1;

  void button1() {
    setState(() {
      if (_isButton1Expanded) {
        _msg1 = "Expand";
        _isButton1Expanded = false;
        _button1Flex = 1;
        _button2Flex = 1;
        _button3Flex = 1;
      } else {
        _msg1 = "Collapse";
        _msg3 = "Expand";
        _isButton1Expanded = true;
        _isButton3Expanded = false;
        _button1Flex = 2;
        _button2Flex = 1;
        _button3Flex = 1;
      }
    });
  }

  void button2() {
    setState(() {
      if (_isButton2Activated) {
        _isButton2Activated = false;
        _msg2 = "Gimme Cake!";
      } else {
        _isButton2Activated = true;
        _msg2 = "Eat!";
      }
    });
  }

  void button3() {
    setState(() {
      if (_isButton3Expanded) {
        _msg3 = "Expand";
        _isButton3Expanded = false;
        _button1Flex = 1;
        _button2Flex = 1;
        _button3Flex = 1;
      } else {
        _msg3 = "Collapse";
        _msg1 = "Expand";
        _isButton3Expanded = true;
        _isButton1Expanded = false;
        _button1Flex = 1;
        _button2Flex = 1;
        _button3Flex = 2;
      }
    });
  }

  Widget buildCake() {
    if (_isButton2Activated) {
      return Column(
        children: [
          Container(
            height: 30,
            width: 50,
            color: Colors.green,
          ),
          Container(
            height: 40,
            width: 70,
            color: Colors.blue,
          ),
          Container(
            height: 50,
            width: 110,
            color: Colors.pink,
          ),
        ],
      );
    } else {
      return Column();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text("Stateful Single Page Application"),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            width: 600,
            color: Colors.grey,
            margin: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 0.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [buildCake()],
            )),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: _button1Flex,
                child: ElevatedButton(
                    child: Text(_msg1),
                    onPressed: button1,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber[600],
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: _button2Flex,
                child: ElevatedButton(
                    onPressed: button2,
                    child: Text(_msg2),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber[600],
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: _button3Flex,
                child: ElevatedButton(
                    child: Text(_msg3),
                    onPressed: button3,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber[600],
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
