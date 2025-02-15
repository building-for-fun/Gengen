import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/template_provider.dart';
import '../models/template.dart';
import 'canvas_screen.dart';

class TemplateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final templateProvider = Provider.of<TemplateProvider>(context);
    final templates = templateProvider.templates;

    return Scaffold(
      appBar: AppBar(title: Text("Templates")),
      body:
          templates.isEmpty
              ? Center(
                child: Text("No templates available. Tap + to create one."),
              )
              : ListView.builder(
                itemCount: templates.length,
                itemBuilder: (context, index) {
                  final template = templates[index];
                  return ListTile(
                    title: Text(template.name),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  CanvasScreen(templateId: template.id),
                        ),
                      );
                    },
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        heroTag: "addTemplate",
        onPressed: () {
          final newTemplate = Template(
            id: DateTime.now().toString(),
            name: "New Template",
          );
          templateProvider.addTemplate(newTemplate);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
