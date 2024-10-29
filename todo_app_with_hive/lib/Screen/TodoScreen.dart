import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';

import 'hive_db.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final myBox = Hive.box('todos');
  TodoApp db = TodoApp();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (myBox.get("TODOLIST") == null) {
      print("empty");
    } else {
      db.loadData();
    }
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void saveTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        db.todoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateData();
    }
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.blue,
        content: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Add a new task",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: saveTask,
                    color: Colors.white,
                    child: const Text("Save"),
                  ),
                  const SizedBox(width: 8),
                  MaterialButton(
                    onPressed: () => Navigator.of(context).pop(),
                    color: Colors.white,
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Flutter To Do'),
        elevation: 0,
      ),
      body: db.todoList.isEmpty
          ? const Center(child: Text("No items added yet, Please add a task."))
          : ListView.builder(
              itemCount: db.todoList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          setState(() {
                            db.todoList.removeAt(index);
                          });
                          db.updateData();
                        },
                        icon: Icons.delete,
                        backgroundColor: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(12),
                      )
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Checkbox(
                            value: db.todoList[index][1],
                            onChanged: (value) => checkBoxChanged(value, index),
                            activeColor: Colors.black,
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(
                            db.todoList[index][0],
                            style: TextStyle(
                              decoration: db.todoList[index][1]
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: db.todoList[index][1]
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
