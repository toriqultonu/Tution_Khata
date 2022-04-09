import 'package:flutter/material.dart';

import '../components/text_dialog_widget.dart';

Future<T?> showTextDialog<T>(

    BuildContext context, {
      required String title,
      required String value,
    }) => showDialog<T>(
  context: context,
  builder: (context) => TextDialogWidget(
    title: title,
    value: value,
  ),
);