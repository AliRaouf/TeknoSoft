import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/bloc/sql/sql_cubit.dart';

import '../model/todo_model.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime dateTime = DateTime.now();
  List<Todo>? filteredList;
  List<Todo>? tasks;

  @override
  void initState() {
    tasks = SqlCubit.get(context).taskList!;
    filteredList = tasks!
        .where((task) =>
            DateTime.parse(task.date).day == dateTime.day &&
            DateTime.parse(task.date).month == dateTime.month &&
            DateTime.parse(task.date).year == dateTime.year)
        .toList();
    print(filteredList!.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff232425),
      appBar: AppBar(
        title: Text(
          "Tasks",
          style: GoogleFonts.robotoCondensed(
              color: Color(0xfffefefe), fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.05),
        child: Column(
          children: [
            EasyDateTimeLine(
              headerProps: EasyHeaderProps(
                  monthPickerType: MonthPickerType.switcher,
                  selectedDateStyle:
                      GoogleFonts.robotoCondensed(color: Colors.white),
                  monthStyle: GoogleFonts.robotoCondensed(color: Colors.white)),
              initialDate: dateTime,
              onDateChange: (selectedDate) {
                dateTime = selectedDate;
                filteredList = tasks!
                    .where((task) =>
                        DateTime.parse(task.date).day == dateTime.day &&
                        DateTime.parse(task.date).month == dateTime.month &&
                        DateTime.parse(task.date).year == dateTime.year)
                    .toList();
                setState(() {});
              },
              activeColor: const Color(0xff85A389),
              dayProps: EasyDayProps(
                inactiveDayStyle: DayStyle(
                    dayNumStyle: TextStyle(color: Colors.white, fontSize: 18)),
                todayStyle: DayStyle(
                    monthStrStyle:
                        GoogleFonts.robotoCondensed(color: Colors.white),
                    dayStrStyle:
                        GoogleFonts.robotoCondensed(color: Colors.white)),
                todayHighlightStyle: TodayHighlightStyle.withBackground,
                todayHighlightColor: Color(0xff3c72af),
              ),
            ),
            filteredList!.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: filteredList!.length,
                      padding: EdgeInsets.only(top: h * 0.05),
                      itemBuilder: (context, index) {
                        return Container(
                          width: w * 0.8,
                          height: h * 0.1,
                          decoration: BoxDecoration(
                            color: Color(0xff343434),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.white54,
                                      ),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${index + 1}",
                                          style: GoogleFonts.robotoCondensed(
                                              color: Color(0xff85A389),
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold)),
                                    ))),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(filteredList![index].name,
                                      style: GoogleFonts.robotoCondensed(
                                          color: Color(0xff3c72af),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  Text(filteredList![index].time,
                                      style: GoogleFonts.robotoCondensed(
                                          color: Color(0xff8b8b8b),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blue),
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                        ),
                                      ),
                                      Text("  ${filteredList![index].type}",style:GoogleFonts.robotoCondensed(color:Color(0xffFefefe),fontWeight:FontWeight.w500,fontSize:16))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Start Adding Tasks for that Date!",
                        style:
                            GoogleFonts.robotoCondensed(color: Colors.white)),
                  )
          ],
        ),
      ),
    );
  }
}
