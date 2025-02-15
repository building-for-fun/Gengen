import 'package:flutter/material.dart';
import '../models/template.dart';
import '../models/text_element.dart';

class TemplateProvider extends ChangeNotifier {
  List<TextElement> _textElements = [];

  List<TextElement> get textElements => _textElements;

  final List<Template> _templates = [];

  List<Template> get templates => _templates;

  void addTemplate(Template template) {
    _templates.add(template);
    notifyListeners();
  }

  void deleteTemplate(String id) {
    _templates.removeWhere((template) => template.id == id);
    notifyListeners();
  }

  Template? getTemplateById(String id) {
    return _templates.firstWhere(
      (t) => t.id == id,
      orElse: () => Template(id: id, name: "New Template"),
    );
  }

  void addTextElementToTemplate(String templateId, TextElement textElement) {
    final index = _templates.indexWhere((t) => t.id == templateId);
    if (index != -1) {
      _templates[index] = _templates[index].copyWith(
        textElements: [..._templates[index].textElements, textElement],
      );
      notifyListeners();
    }
  }

  void updateTextElementInTemplate(
    String templateId,
    String textElementId,
    TextElement updatedElement,
  ) {
    final templateIndex = _templates.indexWhere((t) => t.id == templateId);
    if (templateIndex != -1) {
      final updatedTextElements =
          _templates[templateIndex].textElements.map((element) {
            return element.id == textElementId ? updatedElement : element;
          }).toList();

      _templates[templateIndex] = _templates[templateIndex].copyWith(
        textElements: updatedTextElements,
      );
      notifyListeners();
    }
  }
}
