import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../model/todo_model.dart';

class TodoController extends GetxController {
  RxList<TodoModel> allTodo = <TodoModel>[].obs;

  void addTodo(TodoModel todo) {
    allTodo.add(todo);
  }

  void removeTodo(TodoModel todo) {
    allTodo.remove(todo);
  }
}
