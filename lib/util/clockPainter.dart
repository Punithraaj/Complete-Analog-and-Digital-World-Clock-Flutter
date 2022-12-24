import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_clock/util/utility.dart';

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerx = size.width / 2;
    var centery = size.height / 2;
    var center = Offset(centerx, centery);
    var radius = min(centerx, centery);
    var outerRadius = radius - 20;
    var innerRadius = radius - 30;

    var hourDashPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 180; i += 45) {
      double x1 = centerx - outerRadius * cos(i * pi / 90);
      double y1 = centerx - outerRadius * sin(i * pi / 90);
      double x2 = centerx - innerRadius * cos(i * pi / 90);
      double y2 = centerx - innerRadius * sin(i * pi / 90);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), hourDashPaint);
    }

    var secHandBrush = Paint()
      ..color = Color(0xffff2525)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    var secHandX = centerx + 130 * cos(currentTime.second * 6 * pi / 180);
    var secHandY = centerx + 130 * sin(currentTime.second * 6 * pi / 180);

    var minHandBrush = Paint()
      ..color = Color(0xff3c1361)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    var minHandX = centerx + 100 * cos(currentTime.minute * 6 * pi / 180);
    var minHandY = centerx + 100 * sin(currentTime.minute * 6 * pi / 180);

    var houHandBrush = Paint()
      ..color = Color(0xffffc03d)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;
    var houHandX = centerx +
        60 * cos((currentTime.hour * 30 + currentTime.minute * 0.5) * pi / 180);
    var houHandY = centerx +
        60 * sin((currentTime.hour * 30 + currentTime.minute * 0.5) * pi / 180);

    var dashBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
    canvas.drawLine(center, Offset(houHandX, houHandY), houHandBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
