import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  /// Creates a basic button with customizable properties
  const PrimaryButton({
    required this.onPressed,
    required this.text,
    this.width,
    this.height = 48,
    this.borderRadius = 4,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.isLoading = false,
    this.leadingIcon,
    this.trailingIcon,
    super.key,
  });

  /// The callback that is called when the button is tapped
  final VoidCallback onPressed;

  /// The text to display on the button
  final String text;

  /// Optional width of the button (defaults to match parent)
  final double? width;

  /// Height of the button
  final double height;

  /// Border radius of the button
  final double borderRadius;

  /// Font size of the button text
  final double fontSize;

  /// Font weight of the button text
  final FontWeight fontWeight;

  /// Whether to show a loading indicator instead of text
  final bool isLoading;

  /// Optional icon to display before the text
  final IconData? leadingIcon;

  /// Optional icon to display after the text
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: _buildButtonContent(context),
      ),
    );
  }

  Widget _buildButtonContent(
    BuildContext context,
  ) {
    if (isLoading) {
      return const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leadingIcon != null)
          Icon(
            leadingIcon,
            size: 20,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        const SizedBox(width: 8),
        if (trailingIcon != null)
          Icon(
            trailingIcon,
            size: 20,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
      ],
    );
  }
}
