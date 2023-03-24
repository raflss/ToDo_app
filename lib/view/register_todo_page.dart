import 'package:provider/provider.dart';
import 'package:todo_lovepeople/controllers/register_todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_lovepeople/view/home_page.dart';

class RegisterTodoPage extends StatefulWidget {
  const RegisterTodoPage({super.key});

  @override
  State<RegisterTodoPage> createState() => _RegisterTodoPageState();
}

class _RegisterTodoPageState extends State<RegisterTodoPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterTodoController>(
        builder: (context, controller, child) {
      return Scaffold(
        backgroundColor: Colors.deepPurpleAccent[700],
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Text(
                'Nova tarefa',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Título da tarefa'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: TextField(
                  textAlign: TextAlign.start,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 300),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: 'Escreva uma descrição para sua tarefa',
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Expanded(
                  child: Row(
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.amber[50],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.pink[50],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.purple[50],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.green[50],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.blue[50],
                  ),
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.register(
                        _titleController.text,
                        _descriptionController.text,
                        success: () {
                          Navigator.pop(context, true);
                        },
                      );
                    },
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 100,
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      );
    });
  }
}
