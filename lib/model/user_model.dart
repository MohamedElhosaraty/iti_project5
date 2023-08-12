// To parse this JSON data, do
//
//     final todoModels = todoModelsFromJson(jsonString);

import 'dart:convert';

List<TodoModels> todoModelsFromJson(String str) => List<TodoModels>.from(json.decode(str).map((x) => TodoModels.fromJson(x)));

String todoModelsToJson(List<TodoModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModels {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoModels({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory TodoModels.fromJson(Map<String, dynamic> json) => TodoModels(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}

