import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'matrix.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Walking through the fields'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPressed = false;
  String field = 'field';
  Matrix matrix = Matrix(position: 0);
  late List actualField;

  void formatField() {
    field = matrix.totalfield.toString();
    field = field.replaceAll('[[', ' [');
    field = field.replaceAll(']]', ']');
    field = field.replaceAll('],', '] x');
    field = field.replaceAll('x', '\n');
  }

  @override
  void initState() {
    super.initState();
    matrix.initField();
    field = matrix.totalfield.toString();
    field = field.replaceAll('[[', ' [');
    field = field.replaceAll(']]', ']');
    field = field.replaceAll('],', '] x');
    field = field.replaceAll('x', '\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blueAccent,
              constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  maxWidth: double.infinity,
                  minHeight: double.infinity,
                  maxHeight: double.infinity),
              child: Center(
                child: Text(
                  field,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
              color: Colors.blueGrey,
              child: Center(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          matrix.moveUp();
                          formatField();
                          print('up');
                        });
                      },
                      child: Image.asset(
                        'images/upx.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              matrix.moveLeft();
                              formatField();
                              print('left');
                            });
                          },
                          child: Image.asset(
                            'images/leftx.png',
                            height: 60,
                            width: 60,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              matrix.moveDown();
                              formatField();
                              print('down');
                            });
                          },
                          child: Image.asset(
                            'images/downx.png',
                            height: 60,
                            width: 60,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              matrix.moveRight();
                              formatField();
                              print('right');
                            });
                          },
                          child: Image.asset(
                            'images/rightx.png',
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
