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
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 15,
                    ),
                    child: ListTile(
                      title: Text(todo.title),
                      subtitle: Text(todo.subtitle),
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.bookmark,
                            size: 35,
                            color: Colors.blue[600],
                          ),
                          Checkbox(
                            value: todo.isDone,
                            onChanged: (bool? newValue) {
                              todoController.toggleTodo(index);
                            },
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, color: Colors.blue),
                          ),
                          IconButton(
                            onPressed: () {
                              todoController.deleteTodo(index);
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
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
