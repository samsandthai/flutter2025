import 'package:flutter/material.dart';
import 'Product.dart';
import 'Developer.dart';
import 'homepage.dart';
import 'Drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project App - Student',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
        fontFamily: 'Phetsarath', // ສາມາດປ່ຽນ Font ໃຫ້ເໝາະສົມ
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}