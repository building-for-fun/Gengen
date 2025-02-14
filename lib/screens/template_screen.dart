import 'package:flutter/material.dart';
import '../widgets/draggable_widget.dart';

class TemplateScreen extends StatefulWidget {
  @override
  _TemplateScreenState createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  List<Widget> elements = [];

  void addTextElement() {
    setState(() {
      elements.add(
        DraggableWidget(
          child: Text(
            "Edit Me",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Template")),
      body: Stack(children: [...elements]),
      floatingActionButton: FloatingActionButton(
        onPressed: addTextElement,
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
