import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  GenderButton(
      {super.key,
      required this.h,
      required this.w,
      required this.gender,
      required this.icon,
      required this.text,
      required this.selectedColor,
      required this.onPressed});

  double h;
  double w;
  bool gender;
  IconData icon;
  String text;
  Color selectedColor;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(side: MaterialStatePropertyAll(BorderSide(color: gender==true?selectedColor:Colors.grey)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            fixedSize: MaterialStatePropertyAll(Size(w * 0.425, h * 0.15))),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,color: gender==true?selectedColor:Colors.grey,
              size: 60,
            ),
            Text(
              text,
              style: TextStyle(
                  color:gender==true?Color(0xff232425):Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            )
          ],
        ));
  }
}
