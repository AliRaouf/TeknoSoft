import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';

class WeightScroll extends StatefulWidget {
  WeightScroll({super.key,required this.w,required this.h,required this.currentIndex,required this.onChanged});
  double h;
  double w;
  int currentIndex;
  final ValueChanged<int> onChanged;
  @override
  State<WeightScroll> createState() => _WeightScrollState();
}

class _WeightScrollState extends State<WeightScroll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      height: widget.h * 0.15,
      width: widget.w * 0.425,
      child: Center(
        child: WheelSlider.number(
          isInfinite: false,
          showPointer: true,
          customPointer: Container(
            margin: EdgeInsets.only(bottom: 40),
            child: CustomPaint(
              size: Size(10, 10), // Change the size as needed
              painter: UpwardTrianglePainter(),
            ),
          ),
          horizontalListWidth: 120,
          background: Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
          ),
          selectedNumberStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff232425)),
          perspective: 0.01,
          totalCount: 150,
          initValue: 50,
          unSelectedNumberStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black54,
          ),
          currentIndex: widget.currentIndex,
          onValueChanged: (val) {
            widget.onChanged(val);
            setState(() {});
          },
        ),
      ),
    );
  }
}
class UpwardTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color(0xff232425)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
