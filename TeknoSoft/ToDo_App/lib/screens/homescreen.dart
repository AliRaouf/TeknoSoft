import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(floatingActionButton: FloatingActionButton(child:
    Container(
        width: w,
        height: h,
        child: Center(
            child: Icon(Icons.add,color: Color(0xfffefefe),)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          gradient: LinearGradient(
            stops: [0, 1],
            colors: [Color(0xFF00458e), Color(0xFF000328)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        )),
        shape: CircleBorder(), onPressed: () {},
    ),
      backgroundColor: Color(0xff232425),
      appBar: AppBar(
        title: Text(
          "Tasks",
          style: GoogleFonts.robotoCondensed(
              color: Color(0xfffefefe), fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Color(0xff3c72af),
                      value: 0.4,
                      backgroundColor: Colors.grey,
                    )),
                Text(
                  "  Today's Progress",
                  style: GoogleFonts.robotoCondensed(
                      color: Color(0xff56a2ff),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                Text(
                  " 5 Tasks Left",
                  style: GoogleFonts.robotoCondensed(
                      color: Color(0xff8e8e8e),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff343434),
                  borderRadius: BorderRadius.circular(20)),
              height: h*0.31,
              margin: EdgeInsets.only(top: h*0.04),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Container(
                      height: h*0.09,
                      child: Row(
                        children: [
                          Icon(
                            Icons.light_mode,
                            color: Color(0xff56a2ff),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "My Day",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Color(0xff56a2ff),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                Text(
                                  "7 Tasks",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Color(0xff8e8e8e),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      height: h*0.09,
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xff56a2ff),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Upcoming",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Color(0xff56a2ff),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                Text(
                                  "12 Tasks",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Color(0xff8e8e8e),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      height: h*0.09,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xff56a2ff),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Important",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Color(0xff56a2ff),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                Text(
                                  "3 Tasks",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Color(0xff8e8e8e),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: w * 0.425,
                    height: h * 0.175,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 24),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.person,size: 24,color: Color(0xffFEFEFE).withOpacity(0.5)),
                          SizedBox(height: h*0.05,),
                          Text(
                            "Personal",
                            style: GoogleFonts.robotoCondensed(
                                color: Color(0xffFEFEFE),
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                          Text(
                            "05 Tasks",
                            style: GoogleFonts.robotoCondensed(
                                color: Color(0xffa9a9a9),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [Color(0xFF60efff),Color(0xFF0061ff)],
                        stops: [0, 1],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    )),
                Container(
                    width: w * 0.425,
                    height: h * 0.175,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 24),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.note,size: 24,color: Color(0xffFEFEFE).withOpacity(0.7)),
                          SizedBox(height: h*0.05,),
                          Text(
                            "Learning",
                            style: GoogleFonts.robotoCondensed(
                                color: Color(0xffFEFEFE),
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                          Text(
                            "02 Tasks",
                            style: GoogleFonts.robotoCondensed(
                                color: Color(0xffa9a9a9),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [Color(0xFFf8acff),Color(0xFF696eff)],
                        stops: [0, 1],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: h * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: w * 0.425,
                    height: h * 0.175,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 24),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.work,size: 24,color: Color(0xffFEFEFE).withOpacity(0.5),),
                          SizedBox(height: h*0.05,),
                          Text(
                            "Learning",
                            style: GoogleFonts.robotoCondensed(
                                color: Color(0xffFEFEFE),
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                          Text(
                            "02 Tasks",
                            style: GoogleFonts.robotoCondensed(
                                color: Color(0xffa9a9a9),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [Color(0xFF557c93),Color(0xFF103783)],
                        stops: [0, 1],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    )),
                Container(
                    width: w * 0.425,
                    height: h * 0.175,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 24),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.shopping_bag,size: 24,color: Color(0xffFEFEFE).withOpacity(0.7)),
                          SizedBox(height: h*0.05,),
                          Text(
                            "Shopping",
                            style: GoogleFonts.robotoCondensed(
                                color: Color(0xffFEFEFE),
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                          Text(
                            "01 Tasks",
                            style: GoogleFonts.robotoCondensed(
                                color: Color(0xffa9a9a9),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [Color(0xFFf19e18),Color(0xFFe62314)],
                        stops: [0, 1],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
