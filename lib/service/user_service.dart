import 'package:dio/dio.dart';
import 'package:untitled4/model/user_model.dart';

class UserService{
  String url ='https://jsonplaceholder.typicode.com/todos';
  Future <List<TodoModels>> getUsers() async {
    List<TodoModels> userslist = [];
    final response = await Dio().get(url);
    var data =response.data;
    data.forEach((element){
      TodoModels user = TodoModels.fromJson(element);
      userslist.add(user);
    });
    return userslist;
  }
}