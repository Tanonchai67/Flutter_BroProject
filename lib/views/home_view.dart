import 'package:broproject/controllers/todo_controller.dart';
import 'package:broproject/models/todo_model.dart';
import 'package:broproject/views/add_todo_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Myapp'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Obx(() {
        return Column(
          children: [
            Text("Data", style: TextStyle(fontSize: 20)),
            Expanded(
              child: ListView.builder(
                itemCount: todoController.todoList.length,
                itemBuilder: (context, index) {
                  TodoModel todo = todoController.todoList[index];
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.subtitle),
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (bool? newValue) {
                        todoController.toggleTodo(index);
                      },
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTodoView());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
