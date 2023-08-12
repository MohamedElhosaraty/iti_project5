import 'package:flutter/material.dart';

class body3 extends StatefulWidget {
  const body3({Key? key}) : super(key: key);

  @override
  State<body3> createState() => _body3State();
}

class _body3State extends State<body3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(
          'body3',style: TextStyle(
        fontSize: 30
      ),)),
    );
  }
}
