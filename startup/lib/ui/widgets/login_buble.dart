import 'package:flutter/material.dart';

class LoginBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        /*height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDesign(),
      ),*/
        //decoration: ,
        );
  }
}

class _HeaderDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = Colors.cyan;
    lapiz.style = PaintingStyle.stroke;
    lapiz.strokeWidth = 10;

    final path = new Path();

    path.moveTo(size.width, size.height * 0.15);
    //path.lineTo(size.width * 0.9, size.height * 0.1);
    path.arcToPoint(Offset(size.width * 0.65, size.height * 0.15),
        radius: Radius.circular(150), clockwise: false);
    path.lineTo(size.width * 0.5, size.height * 0.3);
    // path.lineTo(size.width * 0.7, size.height * 0.4);
    // path.lineTo(size.width, size.height * 0.35);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
