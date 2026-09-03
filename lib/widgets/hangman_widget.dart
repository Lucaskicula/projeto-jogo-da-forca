import 'package:flutter/material.dart';

class HangmanWidget extends StatelessWidget {
  const HangmanWidget({super.key, required this.errors});

  final int errors;

  Color partColor(int step) {
    return errors >= step ? Colors.black87 : Colors.black12;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 105,
      height: 150,
      child: Stack(
        children: [
          Positioned(
            left: 4,
            bottom: 0,
            child: Container(width: 82, height: 4, color: Colors.blue),
          ),
          Positioned(
            left: 20,
            top: 5,
            child: Container(width: 4, height: 145, color: Colors.blue),
          ),
          Positioned(
            left: 20,
            top: 5,
            child: Container(width: 66, height: 4, color: Colors.blue),
          ),
          Positioned(
            left: 82,
            top: 5,
            child: Container(width: 4, height: 24, color: Colors.blue),
          ),
          Positioned(
            left: 69,
            top: 27,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: partColor(1), width: 4),
              ),
            ),
          ),
          Positioned(
            left: 82,
            top: 56,
            child: Container(width: 4, height: 42, color: partColor(2)),
          ),
          Positioned(
            left: 66,
            top: 67,
            child: Transform.rotate(
              angle: -0.8,
              child: Container(width: 4, height: 28, color: partColor(3)),
            ),
          ),
          Positioned(
            left: 98,
            top: 67,
            child: Transform.rotate(
              angle: 0.8,
              child: Container(width: 4, height: 28, color: partColor(4)),
            ),
          ),
          Positioned(
            left: 72,
            top: 93,
            child: Transform.rotate(
              angle: 0.55,
              child: Container(width: 4, height: 34, color: partColor(5)),
            ),
          ),
          Positioned(
            left: 94,
            top: 93,
            child: Transform.rotate(
              angle: -0.55,
              child: Container(width: 4, height: 34, color: partColor(6)),
            ),
          ),
        ],
      ),
    );
  }
}
