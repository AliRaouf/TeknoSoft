import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/bloc/sql/sql_cubit.dart';
import 'package:todo_app/model/todo_model.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  List<String> types = ['Personal', 'Learning', 'Work', 'Experience'];
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController timeFromController = TextEditingController();
  TextEditingController timeToController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var cubit = SqlCubit.get(context);
    return BlocConsumer<SqlCubit, SqlState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Task Added Successfully'),
              ));
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          backgroundColor: Color(0xff232425),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Add Tasks",
              style: GoogleFonts.robotoCondensed(color: Color(0xfffefefe)),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: h * 0.02, horizontal: w * 0.05),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name",
                            style: GoogleFonts.robotoCondensed(
                                color: Color(0xfffefefe)),
                          ),
                        ],
                      ),
                      TextField(
                        controller: nameController,
                        style: TextStyle(color: Color(0xfffefefe)),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Type",
                            style: GoogleFonts.robotoCondensed(
                                color: Color(0xfffefefe)),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: w,
                        child: DropdownMenu<String>(
                          width: w * 0.9,
                          inputDecorationTheme: InputDecorationTheme(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          controller: typeController,
                          textStyle: GoogleFonts.robotoCondensed(
                              color: Color(0xfffefefe)),
                          dropdownMenuEntries: types.map((item) {
                            return DropdownMenuEntry(
                              value: item,
                              label: item.toString(),
                            );
                          }).toList(),
                          onSelected: (value) {
                            typeController.text = value!;
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Time",
                            style: GoogleFonts.robotoCondensed(
                                color: Color(0xfffefefe)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.25,
                            child: TextField(
                              style: TextStyle(color: Color(0xfffefefe)),
                              controller: timeFromController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                            child: Text(
                              "To",
                              style: GoogleFonts.robotoCondensed(
                                  color: Color(0xff8b8b8b)),
                            ),
                          ),
                          SizedBox(
                            width: w * 0.25,
                            child: TextField(
                              controller: timeToController,
                              style: TextStyle(color: Color(0xfffefefe)),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Date",
                            style: GoogleFonts.robotoCondensed(
                                color: Color(0xfffefefe)),
                          ),
                        ],
                      ),
                      TextField(
                        controller: dateController,
                        style: TextStyle(color: Color(0xfffefefe)),
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 7)),
                          );
                          if (picked != null)
                            print({dateController.text = picked.toString()});
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: h * 0.1),
                    width: w * 0.4,
                    height: h * 0.065,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF8711C1), Color(0xFF2472FC)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          shadowColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                      onPressed: () async {
                        if(nameController.text.isEmpty ||timeFromController.text.isEmpty||timeToController.text.isEmpty||typeController.text.isEmpty||dateController.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please fill all the data'),
                              ));
                        }else {
                          await cubit.addTask(
                              Todo(
                                  name: nameController.text,
                                  time:
                                  '${timeFromController
                                      .text} : ${timeToController.text}',
                                  date: dateController.text,
                                  type: typeController.text,
                                  favorite: 'False',
                                  status: 'Waiting'),
                              context);
                        }
                      },
                      child: Text(
                        "Add",
                        style: GoogleFonts.robotoCondensed(
                            color: const Color(0xfffefefe),
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
