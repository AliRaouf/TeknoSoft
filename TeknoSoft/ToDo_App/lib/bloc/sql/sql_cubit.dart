import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/model/todo_model.dart';

import '../../utils/dbhelper.dart';

part 'sql_state.dart';

class SqlCubit extends Cubit<SqlState> {
  SqlCubit() : super(SqlInitial());
  static SqlCubit get(context) =>BlocProvider.of(context);
  List<Todo>? taskList;
  List<Todo>? filteredTasks;
  List<Todo>? todayTasks;
  List<Todo>? upcomingTasks;
  loadTasks(BuildContext context) async {
    emit(LoadTasksLoading());
    try {
      final tasks = await DBHelper.getTasks();
      taskList= tasks;
      print("Success");
      emit(LoadTasksSuccess());
      todayTasks = taskList!.where((task) {
        DateTime today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
        DateTime targetDate = DateTime(DateTime.parse(task.date).year, DateTime.parse(task.date).month, DateTime.parse(task.date).day);
        return today.isAtSameMomentAs(targetDate);
      }).toList();
      filteredTasks = taskList!.where((task) {
        DateTime today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
        DateTime targetDate = DateTime(DateTime.parse(task.date).year, DateTime.parse(task.date).month, DateTime.parse(task.date).day);
        return today.isAtSameMomentAs(targetDate) || targetDate.isAfter(today);
      }).toList();
      upcomingTasks = taskList!.where((task) {
        DateTime today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
        DateTime targetDate = DateTime(DateTime.parse(task.date).year, DateTime.parse(task.date).month, DateTime.parse(task.date).day);
        return targetDate.isAfter(today);
      }).toList();

    } on Exception catch (e) {
      print(e);
      emit(LoadTasksError());
    }
  }

  Future<void> addTask(Todo task,BuildContext context) async {
    emit(AddTaskLoading());
    try {
      await DBHelper.insertTask(task);
      loadTasks(context);
      emit(AddTaskSuccess());
      print("Added");
    } on Exception catch (e) {
      print(e);
      emit(AddTaskError());
    }
  }

  Future<void> updateTask(Todo task,BuildContext context) async {
    emit(UpdateTaskLoading());
    try {
      await DBHelper.updateTask(task);
      loadTasks(context);
      emit(UpdateTaskSuccess());
    } on Exception catch (e) {
      print(e);
      emit(UpdateTaskError());
    }
  }

  Future<void> deleteTask(Todo task,BuildContext context) async {
    emit(DeleteTaskLoading());
    try {
      await DBHelper.deleteTask(task);
      loadTasks(context);
      emit(DeleteTaskSuccess());
    } on Exception catch (e) {
      print(e);
      emit(DeleteTaskError());
    }
  }
}
