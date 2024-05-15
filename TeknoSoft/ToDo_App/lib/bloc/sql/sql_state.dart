part of 'sql_cubit.dart';

@immutable
abstract class SqlState {}

class SqlInitial extends SqlState {}
class LoadTasksLoading extends SqlState {}
class LoadTasksSuccess extends SqlState {}
class LoadTasksError extends SqlState {}
class AddTaskLoading extends SqlState {}
class AddTaskSuccess extends SqlState {}
class AddTaskError extends SqlState {}
class UpdateTaskLoading extends SqlState {}
class UpdateTaskSuccess extends SqlState {}
class UpdateTaskError extends SqlState {}
class DeleteTaskLoading extends SqlState {}
class DeleteTaskSuccess extends SqlState {}
class DeleteTaskError extends SqlState {}
