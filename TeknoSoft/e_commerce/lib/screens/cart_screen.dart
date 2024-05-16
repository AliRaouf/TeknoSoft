import 'package:e_commerce/bloc/store/store_cubit.dart';
import 'package:e_commerce/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>>? items;

  @override
  Widget build(BuildContext context) {
    var cubit = StoreCubit.get(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              child: CustomButton(
                  screenWidth: 1 * w,
                  screenHeight: 0.065 * h,
                  text: "Proceed To Checkout",
                  textStyle: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  onpressed: () {
                    if (items != null || items!.isNotEmpty) {
                      for (var i in items!) {
                        int price = int.parse(i['price']);
                        int count = i['count'];
                        cubit.total = cubit.total + (price * count).toInt();
                      }
                      print(cubit.total);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CheckoutScreen(price: cubit.total),
                          ));
                      cubit.total = 0;
                    }
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //   content: Text('Item Added to Cart'),
                    // ));
                  },
                  bColor: Color(0xff19c463),
                  borderColor: Colors.transparent),
            ),
            appBar: AppBar(
              title: Text(
                'My Cart',
                style: GoogleFonts.openSans(),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: IconButton.outlined(
                onPressed: () {
                  Navigator.pop(context);
                  cubit.total = 0;
                  print(cubit.total);
                },
                icon: Icon(Icons.arrow_back),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
              ),
            ),
            body: SafeArea(
              child: Container(
                width: w,
                height: h,
                child: StreamBuilder(
                  stream: cubit.getCartStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      items = snapshot.data;
                      return items!.isEmpty
                          ? Text(("The Cart is Empty"),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                  fontSize: 14, color: Color(0xff232425)))
                          : Container(
                              width: w,
                              height: h,
                              child: ListView.builder(
                                itemCount: items!.length,
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: Container(
                                      height: h * 0.15,
                                      width: w * 0.9,
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Color(0xfff1f1f1)),
                                            width: w * 0.375,
                                            height: h * 0.14,
                                            child: Center(
                                              child: Image.network(
                                                items![index]["image"],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 0.5 * w,
                                            padding: const EdgeInsets.only(
                                                left: 8.0, bottom: 8, top: 8),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        items![index]['name'],
                                                        style: GoogleFonts
                                                            .openSans(
                                                                color: Color(
                                                                    0xff2a2a2a),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon:
                                                            Icon(Icons.delete))
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "\$${(int.parse(items![index]['price']) * items![index]['count'])}",
                                                      style:
                                                          GoogleFonts.openSans(
                                                              color: Color(
                                                                  0xff2a2a2a),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            if (items![index]
                                                                    ['count'] !=
                                                                1) {
                                                              cubit.changeCount(
                                                                  items![index]
                                                                      ['name'],
                                                                  -1);
                                                            }
                                                          },
                                                          icon: Icon(
                                                            Icons.remove,
                                                            color: Colors.grey,
                                                          ),
                                                          style: ButtonStyle(
                                                              shape: MaterialStatePropertyAll(
                                                                  RoundedRectangleBorder(
                                                                      side: BorderSide(
                                                                          color:
                                                                              Colors.grey)))),
                                                        ),
                                                        Text(
                                                          "${items![index]['count']}",
                                                          style: TextStyle(
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xff232425)),
                                                        ),
                                                        IconButton(
                                                          onPressed: () {
                                                            if (items![index]
                                                                    ['count'] <
                                                                int.parse(items![
                                                                        index][
                                                                    'stock'])) {
                                                              cubit.changeCount(
                                                                  items![index]
                                                                      ['name'],
                                                                  1);
                                                            }
                                                          },
                                                          icon: Icon(
                                                            Icons.add,
                                                            color: Colors.green,
                                                          ),
                                                          style: ButtonStyle(
                                                              shape: MaterialStatePropertyAll(
                                                                  RoundedRectangleBorder(
                                                                      side: BorderSide(
                                                                          color:
                                                                              Colors.green)))),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                    } else {
                      return Text(("Error"),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              fontSize: 14, color: Color(0xff232425)));
                    }
                    return Text(
                      ("Error"),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontSize: 14, color: Color(0xff232425)),
                    );
                  },
                ),
              ),
            ));
      },
    );
  }
}
