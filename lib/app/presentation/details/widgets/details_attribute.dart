import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class DetailsAttribute extends StatelessWidget {
  final String label;
  final String text;

  const DetailsAttribute({Key? key, required this.label, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
            child:
                Text(text, style: TextStyle(color: context.theme.hintColor))),
        Container(
          height: 30,
        )
      ],
    );
  }
}
