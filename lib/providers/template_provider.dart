import 'package:flutter/material.dart';
import '../models/template_model.dart';

class TemplateProvider with ChangeNotifier {
  List<TemplateModel> _templates = [];

  List<TemplateModel> get templates => _templates;

  void addTemplate(TemplateModel template) {
    _templates.add(template);
    notifyListeners();
  }

  void updateTemplate(String id, List<Widget> newElements) {
    final index = _templates.indexWhere((t) => t.id == id);
    if (index != -1) {
      _templates[index].elements = newElements;
      notifyListeners();
    }
  }
}
