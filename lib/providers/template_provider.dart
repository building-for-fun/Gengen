import 'package:flutter/material.dart';
import '../models/text_element.dart';

class TemplateProvider extends ChangeNotifier {
  List<TextElement> _textElements = [];

  List<TextElement> get textElements => _textElements;

  void addTextElement(String text) {
    _textElements.add(
      TextElement(
        id: DateTime.now().toString(),
        text: text,
        position: Offset(100, 100),
        fontSize: 20,
        color: Colors.black,
      ),
    );
    notifyListeners();
  }

  void updateTextElement(String id, TextElement updatedElement) {
    int index = _textElements.indexWhere((element) => element.id == id);
    if (index != -1) {
      _textElements[index] = updatedElement;
      notifyListeners();
    }
  }
}
