import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/template_provider.dart';
import '../models/text_element.dart';

class EditableTextWidget extends StatefulWidget {
  final String templateId;
  final TextElement textElement;

  const EditableTextWidget({
    super.key,
    required this.templateId,
    required this.textElement,
  });

  @override
  _EditableTextWidgetState createState() => _EditableTextWidgetState();
}

class _EditableTextWidgetState extends State<EditableTextWidget> {
  late TextEditingController _controller;
  late Offset _position;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.textElement.text);
    _position = widget.textElement.position;
  }

  void _updatePosition(DragUpdateDetails details) {
    setState(() {
      _position += details.delta;
    });

    Provider.of<TemplateProvider>(
      context,
      listen: false,
    ).updateTextElementInTemplate(
      widget.templateId,
      widget.textElement.id,
      widget.textElement.copyWith(position: _position),
    );
  }

  void _updateText(String newText) {
    Provider.of<TemplateProvider>(
      context,
      listen: false,
    ).updateTextElementInTemplate(
      widget.templateId,
      widget.textElement.id,
      widget.textElement.copyWith(text: newText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _position.dx,
      top: _position.dy,
      child: GestureDetector(
        onPanUpdate: _updatePosition,
        onDoubleTap: () {
          setState(() {
            _isEditing = true;
          });
        },
        child:
            _isEditing
                ? SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _controller,
                    autofocus: true,
                    onSubmitted: (newText) {
                      _updateText(newText);
                      setState(() {
                        _isEditing = false;
                      });
                    },
                  ),
                )
                : Text(
                  widget.textElement.text,
                  style: TextStyle(
                    fontSize: widget.textElement.fontSize,
                    color: widget.textElement.color,
                  ),
                ),
      ),
    );
  }
}
