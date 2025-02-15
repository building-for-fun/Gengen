import 'text_element.dart';

class Template {
  final String id;
  final String name;
  final List<TextElement> textElements;

  Template({
    required this.id,
    required this.name,
    this.textElements = const [],
  });

  Template copyWith({String? name, List<TextElement>? textElements}) {
    return Template(
      id: id,
      name: name ?? this.name,
      textElements: textElements ?? this.textElements,
    );
  }
}
