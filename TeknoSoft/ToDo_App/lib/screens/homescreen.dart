
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/bloc/sql/sql_cubit.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/screens/tasks_screen.dart';

import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState(){
    SqlCubit.get(context).loadTasks(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var cubit = SqlCubit.get(context);
    return BlocBuilder<SqlCubit, SqlState>(
  builder: (context, state) {
    if(state is LoadTasksSuccess) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Container(
                  width: w,
                  height: h,
                  child: Center(
                      child: Icon(
                    Icons.add,
                    color: Color(0xfffefefe),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    gradient: LinearGradient(
                      stops: [0, 1],
                      colors: [Color(0xFF8711C1), Color(0xFF2472FC)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  )),
              shape: CircleBorder(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddTaskScreen(),
                    ));
              },
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
              padding: EdgeInsets.symmetric(
                  vertical: h * 0.02, horizontal: w * 0.05),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Color(0xff3c72af),
                            value: ((cubit.todayTasks!.where((element) => element.status=='Done').length)/(cubit.todayTasks!.length)).isNaN ? 0 : ((cubit.todayTasks!.where((element) => element.status=='Done').length)/(cubit.todayTasks!.length)).isInfinite ? 0 :((cubit.todayTasks!.where((element) => element.status=='Done').length)/(cubit.todayTasks!.length)),
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
                        " ${cubit.todayTasks?.where((element) => element.status=='Waiting').length??"0"} Tasks Left",
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
                    height: h * 0.31,
                    margin: EdgeInsets.only(top: h * 0.04),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.07),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TasksScreen(),
                                  ));
                            },
                            child: Container(
                              color: Colors.transparent,
                              height: h * 0.09,
                              width: w,
                              child: GestureDetector(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.light_mode,
                                      color: Color(0xff56a2ff),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.03),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "My Day",
                                            style: GoogleFonts.robotoCondensed(
                                                color: Color(0xff56a2ff),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16),
                                          ),
                                          Text(
                                           "${cubit.todayTasks?.length??"0"} Tasks",
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
                            ),
                          ),
                          Divider(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TasksScreen(),
                                  ));
                            },
                            child: Container(
                              color: Colors.transparent,
                              height: h * 0.09,
                              width: w,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: Color(0xff56a2ff),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: w * 0.03),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Upcoming",
                                          style: GoogleFonts.robotoCondensed(
                                              color: Color(0xff56a2ff),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "${cubit.upcomingTasks?.length??"0"} Tasks",
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
                          ),
                          Divider(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TasksScreen(),
                                  ));
                            },
                            child: Container(
                              color: Colors.transparent,
                              height: h * 0.09,
                              width: w,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xff56a2ff),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: w * 0.03),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Important",
                                          style: GoogleFonts.robotoCondensed(
                                              color: Color(0xff56a2ff),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),
                                        ),
                                        Text(
                                            "${cubit.filteredTasks!.where((element) =>element.favorite=='True').length} Tasks",
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
                          height: h * 0.18,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.person,
                                    size: 24,
                                    color: Color(0xffFEFEFE).withOpacity(0.5)),
                                SizedBox(
                                  height: h * 0.05,
                                ),
                                Text(
                                  "Personal",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Color(0xffFEFEFE),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                                Text(
                                  "${cubit.filteredTasks!.where((element) =>element.type=='Personal').length} Tasks",
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
                              colors: [Color(0xFF60efff), Color(0xFF0061ff)],
                              stops: [0, 1],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          )),
                      Container(
                          width: w * 0.425,
                          height: h * 0.18,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.note,
                                    size: 24,
                                    color: Color(0xffFEFEFE).withOpacity(0.7)),
                                SizedBox(
                                  height: h * 0.05,
                                ),
                                Text(
                                  "Learning",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Color(0xffFEFEFE),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                                Text(
                                    "${cubit.filteredTasks!.where((element) =>element.type=='Learning').length} Tasks",
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
                              colors: [Color(0xFFf8acff), Color(0xFF696eff)],
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
                          height: h * 0.18,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.work,
                                  size: 24,
                                  color: Color(0xffFEFEFE).withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: h * 0.05,
                                ),
                                Text(
                                  "Work",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Color(0xffFEFEFE),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                                Text(
                                  "${cubit.filteredTasks!.where((element) =>element.type=='Work').length} Tasks",
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
                              colors: [Color(0xFF557c93), Color(0xFF103783)],
                              stops: [0, 1],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          )),
                      Container(
                          width: w * 0.425,
                          height: h * 0.18,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.shopping_bag,
                                    size: 24,
                                    color: Color(0xffFEFEFE).withOpacity(0.7)),
                                SizedBox(
                                  height: h * 0.05,
                                ),
                                Text(
                                  "Shopping",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Color(0xffFEFEFE),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                                Text(
                                    "${cubit.filteredTasks!.where((element) =>element.type=='Shopping').length} Tasks",
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
                              colors: [Color(0xFFf19e18), Color(0xFFe62314)],
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
    else{
      return Scaffold(backgroundColor: Color(0xff232425),
          body: Center(child: CircularProgressIndicator()));
    }
      },
);
  }
}
