import 'package:e_commerce/screens/confirm_payment.dart';
import 'package:e_commerce/widgets/custom_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../bloc/store/store_cubit.dart';
import '../widgets/custom_button.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({super.key, required this.price});

  int price;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

bool delivery = false;
bool online = false;

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = StoreCubit.get(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(bottomNavigationBar: BottomAppBar(
      elevation: 0,
      child: CustomButton(
          screenWidth: 1 * w,
          screenHeight: 0.065 * h,
          text: "Continue",
          textStyle: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600),
          onpressed: () {
            pushWithNavBar(context, MaterialPageRoute(builder: (context) => ConfirmPaymentScreen()));
            },
          bColor: Color(0xff19c463),
          borderColor: Colors.transparent),
    ),
      appBar: AppBar(
        title: Text(
          "Choose a payment method",
          style: GoogleFonts.openSans(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomOutlineButton(
                h: h,
                w: w,
                selected: delivery,
                text: "Pay On Delivery",
                selectedColor: Color(0xff19c463),
                onPressed: () {
                  delivery = true;
                  setState(() {});
                }),
            SizedBox(
              height: 0.05 * h,
            ),
            CustomOutlineButton(
                h: h,
                w: w,
                selected: online,
                text: "Pay Online (Soon)",
                selectedColor: Color(0xff19c463),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
