part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}
class Todoloading extends TodoState {}
class TodoSuccess extends TodoState {}
class TodoErorr extends TodoState {}
