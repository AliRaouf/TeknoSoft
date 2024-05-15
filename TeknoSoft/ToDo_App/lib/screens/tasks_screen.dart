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
    var cubit = SqlCubit.get(context);
    return Scaffold(
      backgroundColor: Color(0xff232425),
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
        Navigator.pop(context);
      },),
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
                        return Dismissible(
                          key: Key(filteredList![index].name),
                          direction: DismissDirection.horizontal,
                          onDismissed: (direction)async{
                            if (direction == DismissDirection.startToEnd){
                             await cubit.updateTask(Todo(id: filteredList![index].id,name: filteredList![index].name, time: filteredList![index].time, date: filteredList![index].date, type: filteredList![index].type, favorite: filteredList![index].favorite, status: 'Done'), context);
                             ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                   content: Text('${filteredList![index].name} Done'),
                                 ));
                             print(filteredList![index].status);
                            } else if (direction == DismissDirection.endToStart) {
                              setState(()async{
                                await cubit.deleteTask(filteredList![index], context);
                                filteredList!.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${filteredList![index].name} Removed'),
                                ),
                              );
                            }
                          },
                          background: Container(
                            color: Colors.green,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          secondaryBackground: Container(
                            color: Colors.red,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          child: Container(
                            width: w * 0.8,
                            height: h * 0.1,
                            decoration: BoxDecoration(border: Border.all(color: filteredList![index].status=="Done"?Color(0xff85A389):Colors.transparent),
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
                                Padding(
                                  padding: EdgeInsets.only(left:w*0.05),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(filteredList![index].name,
                                          style: GoogleFonts.robotoCondensed(
                                              color: Color(0xffFEFEFE),
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
                                            decoration: BoxDecoration(gradient:filteredList![index].type=='Work'?LinearGradient(
                                              colors: [Color(0xFF557c93),Color(0xFF103783)],
                                              stops: [0, 1],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                            ):filteredList![index].type=='Learning'?LinearGradient(
                                              colors: [Color(0xFFf8acff),Color(0xFF696eff)],
                                              stops: [0, 1],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                            ):filteredList![index].type=='Personal'?LinearGradient(
                                              colors: [Color(0xFF60efff),Color(0xFF0061ff)],
                                              stops: [0, 1],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                            ):LinearGradient(
                                              colors: [Color(0xFFf19e18),Color(0xFFe62314)],
                                              stops: [0, 1],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                            ),
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
                                  ),
                                )
                              ],
                            ),
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
