import 'package:get/get_rx/src/rx_types/rx_types.dart';

class TodoModel {
  RxString todo;
  RxString time;
  RxBool status;

  TodoModel({
    required this.todo,
    required this.time,
    required this.status,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        todo: json["todo"].toString().obs,
        time: json["time"].toString().obs,
        status: (json["status"] as bool).obs,
      );

  Map<String, dynamic> toJson() => {
        "todo": todo.value,
        "time": time.value,
        "status": status.value,
      };
}
