import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ExportButton extends StatefulWidget {
  final ScreenshotController screenshotController;

  ExportButton({required this.screenshotController});

  @override
  _ExportButtonState createState() => _ExportButtonState();
}

class _ExportButtonState extends State<ExportButton> {
  Future<void> _exportImage() async {
    final image = await widget.screenshotController.capture();
    if (image == null) return;

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/template.png');
    await file.writeAsBytes(image);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Image saved at ${file.path}")));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _exportImage,
      child: Icon(Icons.download),
    );
  }
}
