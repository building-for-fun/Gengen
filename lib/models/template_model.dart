import 'package:flutter/material.dart';

class TemplateModel {
  String id;
  String name;
  List<Widget> elements;
  String parentId; // For parent-child structure

  TemplateModel({
    required this.id,
    required this.name,
    required this.elements,
    required this.parentId,
  });
}
