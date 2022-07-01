import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function() onPressed;
  final Color iconColor;

  const CircleButton(
      {Key? key,
      required this.icon,
      required this.iconSize,
      required this.onPressed,
      required this.iconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: iconColor),
        iconSize: iconSize,
      ),
    );
  }
}
