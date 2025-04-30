import 'package:flutter/material.dart';

Text largeText(String text, BuildContext context) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyLarge,
  );
}
