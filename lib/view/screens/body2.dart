import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/model/user_model.dart';
import 'package:untitled4/service/user_service.dart';
import 'package:untitled4/view/cubit/todo_cubit.dart';

class body2 extends StatefulWidget {
  const body2({Key? key}) : super(key: key);

  @override
  State<body2> createState() => _body2State();
}

class _body2State extends State<body2> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(context) =>TodoCubit(),
    child: BlocConsumer<TodoCubit,TodoState>(
        builder: (context,state){
          if(state is Todoloading){
            return Center(child: CircularProgressIndicator());
          }if(state is TodoErorr){
            return Center(child: Text('Error'));
          }
          return   ListView.builder(
            itemCount: context.watch<TodoCubit>().users.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(context.watch<TodoCubit>().users[index].title ?? '___' ),
                leading: Text('${index +1}'),
              );
            },

          );
        }, listener: (context ,state){}),);



  }
}
