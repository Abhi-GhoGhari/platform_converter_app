import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/platform_connvert.dart';
import '../controller/todo_controller.dart';
import '../model/todo_model.dart';

class IosHomePage extends StatelessWidget {
  IosHomePage({super.key});
  final TodoController controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        onTap: (int i) {
          if (i != 0) {
            Get.find<PlatformConvert>().togglePlatform();
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(icon: Icon(m.Icons.change_circle_outlined)),
        ],
      ),
      tabBuilder: (context, index) {
        return index == 0
            ? CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: const Text('Todo'),
                  trailing: m.IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings_brightness_rounded,
                    ),
                  ),
                ),
                child: Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView.builder(
                      itemCount: controller.allTodo.length + 1,
                      itemBuilder: (context, i) => controller.allTodo.length ==
                              i
                          ? CupertinoButton.filled(
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
                          // prototypeItem: const SizedBox(height: 20)
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
                    ),
                  ),
                ),
              )
            : CupertinoPageScaffold(
                child: Container(),
              );
      },
    );
  }
}
