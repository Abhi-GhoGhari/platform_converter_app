import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/platform_connvert.dart';
import '../controller/todo_controller.dart';
import '../model/todo_model.dart';

class AndroidHomePage extends StatelessWidget {
  AndroidHomePage({super.key});

  final TodoController controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        actions: [
          IconButton(
            onPressed: Get.find<PlatformConvert>().togglePlatform,
            icon: const Icon(Icons.change_circle_outlined),
          )
        ],
      ),
      body: Obx(
        () {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.allTodo.length + 1,
            itemBuilder: (context, i) => controller.allTodo.length == i
                ? ElevatedButton(
                    onPressed: () {
                      controller.addTodo(
                        TodoModel(
                          todo: "Write Todo".obs,
                          time: "Todo".obs,
                          status: true.obs,
                        ),
                      );
                    },
                    child: const Text("Add Todo"),
                  )
                : Dismissible(
                    background: const Card(
                      color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      controller.removeTodo(controller.allTodo[i]);
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(controller.allTodo[i].todo.value),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
