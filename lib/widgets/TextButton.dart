import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textbutton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final String text;
  final Color color;
  final Color? colors;
  const Textbutton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.text,
      required this.color,
      this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(text, style: TextStyle(color: colors)),
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: onPressed,
    );
  }
}
