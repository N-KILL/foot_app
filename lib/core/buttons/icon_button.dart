import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.icon,
    required this.onPressed,
    required this.iconColor,
    super.key,
  });

  final IconData icon;
  final void Function() onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: iconColor),
      iconSize: 28,
      onPressed: onPressed,
    );
  }
}
