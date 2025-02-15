import 'package:flutter/material.dart';

class TextElement {
  String id;
  String text;
  Offset position;
  double fontSize;
  Color color;

  TextElement({
    required this.id,
    required this.text,
    required this.position,
    required this.fontSize,
    required this.color,
  });

  TextElement copyWith({
    String? text,
    Offset? position,
    double? fontSize,
    Color? color,
  }) {
    return TextElement(
      id: id,
      text: text ?? this.text,
      position: position ?? this.position,
      fontSize: fontSize ?? this.fontSize,
      color: color ?? this.color,
    );
  }
}
