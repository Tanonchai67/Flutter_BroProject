import 'package:broproject/controllers/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTodoView extends StatelessWidget {
  AddTodoView({super.key});

  TodoController todoController = Get.put(TodoController());
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เพิ่มรายการ"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ชื่อรายการ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'กรุณากรอกชื่อรายการ',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "รายละเอียด",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: subtitleController,
                decoration: InputDecoration(
                  hintText: 'กรุณากรอกรายละเอียดเพิ่มเติม',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isEmpty) return;
                  todoController.addTodo(
                    titleController.text,
                    subtitleController.text,
                  );
                  Get.back();
                  Get.snackbar(
                    "แจ้งเตือน",
                    "บันทึกเรียบร้อย",
                    colorText: Colors.white,
                    backgroundColor: Colors.lightBlue,
                    snackPosition: SnackPosition.BOTTOM,
                    borderRadius: 10,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(15),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "บันทึก",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
