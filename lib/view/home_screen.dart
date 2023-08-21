import 'package:flutter/material.dart';
import 'package:untitled4/view/screens/body1.dart';
import 'package:untitled4/view/screens/body2.dart';
import 'package:untitled4/view/screens/category2.dart';

class HomeScreen extends StatefulWidget {
  String email;
   HomeScreen({ super.key, required this.email, });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex =0;
  List <Widget> page =[
    body1(),
    body2(),
    Category2(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        },icon: Icon(Icons.arrow_back_ios),
        ),
      ),
       body:Container(

           child: page[currentIndex]),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'body1'),
        BottomNavigationBarItem(icon: Icon(Icons.security),label: 'body2'),
        BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: 'category'),
      ],
      onTap: (value){
        setState(() {
          currentIndex =value;
        });
        print (value);
      },
      ),
    );
  }
}
