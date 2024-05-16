import 'package:e_commerce/bloc/store/store_cubit.dart';
import 'package:e_commerce/screens/cart_screen.dart';
import 'package:e_commerce/screens/item_screen.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../bloc/user/user_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> items = ['All', 'SmartPhone', 'HeadPhone', 'Laptop'];
  int selectedIndex = 0;
@override
  void initState() {
    UserCubit.get(context).receiverUserData();
    StoreCubit.get(context).getCartStream();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var cubit = StoreCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Discover",
            style: GoogleFonts.openSans(
                color: Color(0xff2a2a2a), fontWeight: FontWeight.w500)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                        CircleBorder(side: BorderSide(color: Colors.grey)))),
                onPressed: () {
                  pushWithoutNavBar(context, MaterialPageRoute(builder: (context) => CartScreen(),));
                },
                icon: Icon(Icons.shopping_bag_outlined)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              controller: searchController,
              obscureText: false,
              readOnly: false,
              hint: "Search",
              icon: Icon(Icons.search),
              iconColor: Color(0xff2a2a2a),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: h * 0.02),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff19c463)),
              width: w,
              height: 0.2 * h,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "There is no ongoing sale",
                  style: GoogleFonts.openSans(
                      color: Color(0xfff1f1f1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: GoogleFonts.openSans(
                      color: Color(0xff2a2a2a),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See all",
                    style: GoogleFonts.openSans(
                        color: Color(0xff19c463),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            Container(margin: EdgeInsets.only(bottom: 12),
              width: w,
              height: 0.06 * h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.01 * w),
                    child: ElevatedButton(
                      onPressed: () {
                        selectedIndex = index;
                        setState(() {});
                        print(cubit.itemStream?.first
                            .then((value) => print(value)));
                      },
                      child: Text(
                        item,
                        style: GoogleFonts.openSans(
                            color: selectedIndex == index
                                ? Colors.white
                                : Color(0xff2a2a2a),
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w500),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              selectedIndex == index
                                  ? Color(0xff19c463)
                                  : Colors.white),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: selectedIndex == index
                                          ? Colors.transparent
                                          : Colors.black)))),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: cubit.getItemStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    List? items;
                    if (selectedIndex==0) {
                      items = snapshot.data!;
                    }else if(selectedIndex==1){
                      items = snapshot.data!;
                      items = items!.where((e) => e['category']=='SmartPhone').toList();
                    }
                    else if(selectedIndex==2){
                      items = snapshot.data!;
                      items = items!.where((e) => e['category']=='HeadPhone').toList();
                    }
                    else{
                      items = snapshot.data!;
                      items = items!.where((e) => e['category']=='Laptop').toList();
                    }
                    return items!.isEmpty
                        ? Text(("De7k"),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                                fontSize: 14, color: Color(0xff232425)))
                        : GridView.builder(
                            shrinkWrap: true,
                            itemCount: items.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return GestureDetector(onTap: () {
                                pushScreen(
                                  context,
                                  screen: ItemScreen(item: items![index]),
                                  withNavBar: false,
                                );
                              },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
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
                                    Expanded(
                                      child: Text(
                                        items[index]['name'],
                                        style: GoogleFonts.openSans(
                                            color: Colors.grey[600]),
                                      ),
                                    ),
                                    Text(
                                      "\$${items[index]['price']}",
                                      style: GoogleFonts.openSans(
                                          color: Color(0xff2a2a2a),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                  } else {
                    return Text((snapshot.error.toString()),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            fontSize: 14, color: Color(0xff232425)));
                  }
                  return Text(
                    (snapshot.error.toString()),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        fontSize: 14, color: Color(0xff232425)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
