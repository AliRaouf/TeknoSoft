import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/store/store_cubit.dart';

class DeliveryScreen extends StatelessWidget {
  DeliveryScreen({super.key});
  List<Map<String,dynamic>>? items;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var cubit = StoreCubit.get(context);
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'Delivery',
                style: GoogleFonts.openSans(),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: SafeArea(
              child: Container(
                width: w,
                height: h,
                child: StreamBuilder(
                  stream: cubit.getDeliveryStream(),
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
                                          Text(
                                            items![index]['status'],
                                            style: GoogleFonts
                                                .openSans(
                                                color: Color(
                                                    0xff2a2a2a),
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight
                                                    .w400),
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
