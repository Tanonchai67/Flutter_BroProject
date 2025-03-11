import 'package:broproject/services/storage_service.dart';
import 'package:broproject/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await StorageService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: "Flutter GetX", home: HomeView());
  }
}
