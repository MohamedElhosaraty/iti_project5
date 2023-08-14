import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled4/model/user_model.dart';
import 'package:untitled4/service/user_service.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial()){
    getMyUsers();
  }
  List<TodoModels> users =[];
  getMyUsers() async {
   try{
     emit(Todoloading());
     users =await UserService().getUsers();
     emit(TodoSuccess());
   }catch (e){
     emit(TodoErorr());
   }

  }

}
