import 'package:file_manager/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FileManager());
}

class FileManager extends StatelessWidget {
  const FileManager({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cloud File Manager',
      home: HomePage(),
    );
  }
}

