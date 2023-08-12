import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class body1 extends StatefulWidget {
  const body1({Key? key}) : super(key: key);

  @override
  State<body1> createState() => _body1State();
}


class _body1State extends State<body1> {

  String email ='';
  getdataEmail() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? '--';

    });
  }
  @override
  void initState(){
   super.initState();
   getdataEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Center(child: Text('body1 \n $email',style: TextStyle(
         fontSize: 30
     ),)),
    );
  }
}
