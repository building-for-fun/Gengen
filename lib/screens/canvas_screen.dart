import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import '../providers/template_provider.dart';
import '../widgets/editable_text_widget.dart';
import '../widgets/export_button.dart'; // Import the export button

class CanvasScreen extends StatelessWidget {
  const CanvasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create Screenshot Controller
    final ScreenshotController screenshotController = ScreenshotController();

    return Scaffold(
      appBar: AppBar(title: Text("Template Editor")),
      body: Screenshot(
        controller: screenshotController,
        child: Stack(
          children: [
            // Background area
            Container(
              color: Colors.grey[200], // Background color
            ),

            // Stack all text elements
            Consumer<TemplateProvider>(
              builder: (context, templateProvider, child) {
                return Stack(
                  children:
                      templateProvider.textElements
                          .map(
                            (element) =>
                                EditableTextWidget(textElement: element),
                          )
                          .toList(),
                );
              },
            ),
          ],
        ),
      ),

      // Floating buttons for adding text & exporting
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'addTextButton', // Unique hero tag
            onPressed: () {
              Provider.of<TemplateProvider>(
                context,
                listen: false,
              ).addTextElement("New Text");
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
