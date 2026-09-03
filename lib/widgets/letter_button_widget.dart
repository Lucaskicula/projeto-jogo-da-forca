import 'package:flutter/material.dart';

class LetterButtonWidget extends StatelessWidget {
  const LetterButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.wasUsed = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool wasUsed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 46,
      child: ElevatedButton(
        onPressed: wasUsed ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          disabledBackgroundColor: Colors.blue.shade100,
          disabledForegroundColor: Colors.blue.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
