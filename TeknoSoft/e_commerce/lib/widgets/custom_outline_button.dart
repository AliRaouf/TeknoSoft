import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlineButton extends StatelessWidget {
  CustomOutlineButton(
      {super.key,
        required this.h,
        required this.w,
        required this.selected,
        required this.text,
        required this.selectedColor,
        required this.onPressed});

  double h;
  double w;
  bool selected;
  String text;
  Color selectedColor;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(side: MaterialStatePropertyAll(BorderSide(color: selected==true?selectedColor:Colors.grey)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            fixedSize: MaterialStatePropertyAll(Size(w * 0.8, h * 0.05))),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.openSans(
                  color:selected==true?Color(0xff232425):Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            )
          ],
        ));
  }
}