import 'package:flutter/material.dart';
import 'template_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Template Designer")),
      body: Center(
        child: ElevatedButton(
          child: Text("Create New Template"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TemplateScreen()),
            );
          },
        ),
      ),
    );
  }
}
