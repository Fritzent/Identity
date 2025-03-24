import 'package:flutter/material.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/resources/font_config.dart';

class CustomProgressBar extends StatefulWidget {
  final double progress;

  const CustomProgressBar({super.key, required this.progress});

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Ensures Row has a width
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: FontList.font4,
                  decoration: BoxDecoration(
                    color: ColorList.generalGray200AppFonts,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: constraints.maxWidth * widget.progress,
                      height: FontList.font4,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(width: FontList.font6),
          Text(
            "${(widget.progress * 100).toInt()}%",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: FontList.font10,
                fontWeight: FontWeight.bold,
                color: ColorList.generalGray100AppFonts),
          ),
        ],
      ),
    );
  }
}
