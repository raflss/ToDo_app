import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_lovepeople/data/model/todo.dart';
import 'package:todo_lovepeople/controllers/home_controller.dart';
import 'package:todo_lovepeople/view/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeController>().getTODOList();
    return Consumer<HomeController>(
      builder: (context, controller, child) {
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.deepPurpleAccent[700],
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    'Suas listagens',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.todoList.length,
                      itemBuilder: (context, index) {
                        var item = controller.todoList[index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            color: _getColor(item.attributes?.color ?? ''),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child:
                                          Text(item.attributes?.title ?? '')),
                                  IconButton(
                                    onPressed: () =>
                                        _delete(context, item, controller),
                                    icon: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.deepPurpleAccent[700],
                child: Icon(Icons.add),
                disabledElevation: 0,
                onPressed: () {
                  Navigator.pushNamed(context, '/register-todo').then((value) {
                    if (value == true) {
                      controller.getTODOList();
                    }
                  });
                }));
      },
    );
    ;
  }
}

void _delete(BuildContext context, Todo item, HomeController controller) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Deseja deteletar o todo: ${item.attributes?.title}?'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Não'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        controller.delete(
                          item.id?.toString() ?? '',
                          success: () {},
                        );
                      },
                      child: const Text('Sim'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Color _getColor(String color) {
  try {
    if (color.toUpperCase().contains('0XFF')) {
      return Color(int.parse(color));
    }
    return Color(int.parse(color.replaceAll('#', '0xFF')));
  } catch (e) {
    print(e);
    return Colors.white;
  }
}
