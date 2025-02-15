import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import '../providers/template_provider.dart';
import '../models/text_element.dart';
import '../widgets/editable_text_widget.dart';
import '../widgets/export_button.dart'; // Import the export button

class CanvasScreen extends StatelessWidget {
  final String templateId;

  const CanvasScreen({super.key, required this.templateId});

  @override
  Widget build(BuildContext context) {
    // Create Screenshot Controller
    final ScreenshotController screenshotController = ScreenshotController();
    final templateProvider = Provider.of<TemplateProvider>(context);
    final template = templateProvider.getTemplateById(templateId);

    if (template == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Template Not Found")),
        body: Center(child: Text("Template does not exist.")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(template.name)),
      body: Screenshot(
        controller: screenshotController,
        child: Stack(
          children: [
            Container(color: Colors.grey[200]), // Background color
            Consumer<TemplateProvider>(
              builder: (context, provider, child) {
                final updatedTemplate = provider.getTemplateById(templateId);
                return Stack(
                  children:
                      updatedTemplate?.textElements
                          .map(
                            (element) => EditableTextWidget(
                              templateId: updatedTemplate.id,
                              textElement: element,
                            ),
                          )
                          .toList() ??
                      [],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "addText",
            onPressed: () {
              final newTextElement = TextElement(
                id: DateTime.now().toString(),
                text: "New Text",
                position: Offset(100, 100),
                fontSize: 20,
                color: Colors.black,
              );

              // ✅ Add text element to the correct template
              templateProvider.addTextElementToTemplate(
                templateId,
                newTextElement,
              );
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16), // Space between buttons
          ExportButton(screenshotController: screenshotController),
        ],
      ),
    );
  }
}
