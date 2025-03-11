import 'package:broproject/models/todo_model.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;

  void addTodo(String title, String subtitle) {
    todoList.add(TodoModel(title: title, subtitle: subtitle));
  }

  void toggleTodo(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
  }

  void deleteTodo(int index) {
    todoList.removeAt(index);
  }
}
