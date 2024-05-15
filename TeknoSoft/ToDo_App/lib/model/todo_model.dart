class Todo {
  int? id;
  String name;
  String time;
  String date;
  String type;
  String favorite;
  String status;

  Todo(
      {this.id,
      required this.name,
      required this.time,
        required this.date,
      required this.type,
      required this.favorite,
      required this.status});
Map<String,dynamic> toMap(){
  return{
    'id' : id,
    'name' : name,
    'time' : time,
    'date' : date,
    'type' : type,
    'favorite' : favorite,
    'status' : status
  };
}
}
