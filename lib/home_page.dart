import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [];

  void savenewtask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    void checkBoxChanged(int index) {
      setState(() {
        toDoList[index][1] = !toDoList[index][1];
      });
      print(toDoList[index][1]);
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Simple Todo',
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: (toDoList.isEmpty)
          ? const Center(
              child: Text(
                'Add TODO...!',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index) {
                return Todolist(
                  taskname: toDoList[index][0],
                  taskcompleted: toDoList[index][1],
                  onDelete: () {
                    print('delete');
                    setState(() {
                      toDoList.removeAt(index);
                    });
                  },
                  onchanged: (value) => checkBoxChanged(index),
                );
              },
            ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add new todo items ',
                  filled: true,
                  fillColor: Colors.deepPurple.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: savenewtask,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
