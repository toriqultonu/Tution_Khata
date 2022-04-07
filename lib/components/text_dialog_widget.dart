import 'package:flutter/material.dart';

class TextDialogWidget extends StatefulWidget {
  final String title;
  final String value;

  const TextDialogWidget({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        maxLength: 30,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      actions: [ElevatedButton(onPressed: () {
        Navigator.of(context).pop(controller.text);
      }, child: Text('Done'))],
    );
  }
}
