import 'package:flutter/material.dart';
import 'package:untitled4/model/user_model.dart';
import 'package:untitled4/service/user_service.dart';

class body2 extends StatefulWidget {
  const body2({Key? key}) : super(key: key);

  @override
  State<body2> createState() => _body2State();
}

class _body2State extends State<body2> {

  List<TodoModels> users =[];
  bool isloading =true;
  getMyUsers() async {
    users =await UserService().getUsers();
    isloading =false;
    setState(() {
    });
  }
  @override
  void initState() {
    super.initState();
    getMyUsers();
  }
  @override
  Widget build(BuildContext context) {
    return
      isloading ? Center(child: CircularProgressIndicator()) :

      ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(users[index].title ?? '___' ),
           // subtitle: Text(users[index]. ?? '___' ),
           // trailing: Icon(Icons.person),
            leading: Text('${index +1}'),
          );
        },

    );
  }
}
