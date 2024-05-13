import 'package:flutter/material.dart';

class HeightSlider extends StatefulWidget {
  final double min;
  final double max;
  double currentValue;
  final ValueChanged<int> onChanged;
  HeightSlider({required this.min, required this.max,required this.currentValue,required this.onChanged});

  @override
  _HeightSliderState createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Slider(activeColor: Color(0xFFfa9372),
          value: widget.currentValue,
          min: widget.min,
          max: widget.max,
          divisions: (widget.max - widget.min).toInt(),
          label: widget.currentValue.round().toString(),
          onChanged: (value) {
            widget.onChanged(value.round());
            print(widget.currentValue);
            setState(() {
            });
          },
        ),
        Text(
          'Selected value: ${widget.currentValue.round()}',
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}