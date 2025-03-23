import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/resources/font_config.dart';

class DashedBorderPainter extends CustomPainter {
  final double dashWidth = FontList.font4;
  final double dashSpace = FontList.font4;
  final double strokeWidth = 1;
  final Color borderColor = ColorList.generalWhite100AppFonts;
  final double borderRadius = FontList.font16;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = borderColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    ));

    Path dashedPath = createDashedPath(path);

    canvas.drawPath(dashedPath, paint);
  }

  Path createDashedPath(Path originalPath) {
    Path dashedPath = Path();
    PathMetrics pathMetrics = originalPath.computeMetrics(forceClosed: false);

    for (PathMetric pathMetric in pathMetrics) {
      double currentLength = 0;
      while (currentLength < pathMetric.length) {
        double nextDashEnd = currentLength + dashWidth;
        if (nextDashEnd > pathMetric.length) {
          nextDashEnd = pathMetric.length;
        }
        dashedPath.addPath(
          pathMetric.extractPath(currentLength, nextDashEnd),
          Offset.zero,
        );
        currentLength += dashWidth + dashSpace;
      }
    }
    return dashedPath;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}