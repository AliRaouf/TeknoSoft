import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/model/todo_model.dart';

import '../../utils/dbhelper.dart';

part 'sql_state.dart';

class SqlCubit extends Cubit<SqlState> {
  SqlCubit() : super(SqlInitial());
  static SqlCubit get(context) =>BlocProvider.of(context);
  List<Todo>? taskList;
  loadTasks() async {
    emit(LoadTasksLoading());
    try {
      final tasks = await DBHelper.getTasks();
      taskList= tasks;
      print("Success");
      emit(LoadTasksSuccess());
    } on Exception catch (e) {
      print(e);
      emit(LoadTasksError());
    }
  }

  Future<void> addTask(Todo task) async {
    emit(AddTaskLoading());
    try {
      await DBHelper.insertTask(task);
      loadTasks();
      emit(AddTaskSuccess());
      print("Added");
    } on Exception catch (e) {
      print(e);
      emit(AddTaskError());
    }
  }

  Future<void> updateTask(Todo task) async {
    emit(UpdateTaskLoading());
    try {
      await DBHelper.updateTask(task);
      loadTasks();
      emit(UpdateTaskSuccess());
    } on Exception catch (e) {
      print(e);
      emit(UpdateTaskError());
    }
  }

  Future<void> deleteTask(Todo task) async {
    emit(DeleteTaskLoading());
    try {
      await DBHelper.deleteTask(task);
      loadTasks();
      emit(DeleteTaskSuccess());
    } on Exception catch (e) {
      print(e);
      emit(DeleteTaskError());
    }
  }
}
