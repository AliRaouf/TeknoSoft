import 'package:e_commerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/store/store_cubit.dart';

class ItemScreen extends StatelessWidget {
  ItemScreen({super.key, required this.item});

  Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${item["price"]}",
              style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff2a2a2a)),
            ),
            CustomButton(
                screenWidth: 0.5 * w,
                screenHeight: 0.065 * h,
                text: "Add to Cart",
                textStyle: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                onpressed: ()async{
                  item.addAll({"count": 1});
                  await StoreCubit.get(context).addItemToCart(item['name'],item);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Item Added to Cart'),
                      ));
                  Navigator.pop(context);
                },
                bColor: Color(0xff19c463),
                borderColor: Colors.transparent)
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xfff1f1f1),
        leading: IconButton.outlined(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white)),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: w,
            height: 0.4 * h,
            decoration: BoxDecoration(
                color: Color(0xfff1f1f1),
                image: DecorationImage(image: NetworkImage(item["image"]))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["name"],
                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff2a2a2a)),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Text(
                  item["description"],
                  style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2a2a2a)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
