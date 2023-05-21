import 'package:flutter/cupertino.dart';

class CustomProgressBar extends StatelessWidget {
  final double width;
  final double height;
  final double value;
  final Color backgroundColor;
  final Color foregroundColor;

  const CustomProgressBar({
    Key? key,
    required this.width,
    required this.height,
    required this.value,
    required this.backgroundColor,
    required this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(height / 2),
            ),
          ),
          FractionallySizedBox(
            widthFactor: value,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: foregroundColor,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
