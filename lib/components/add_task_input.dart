import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTaskInput extends StatelessWidget {
  final TextEditingController todoController;
  final List<Task> todos; // Deve ser List<Task>
  final Function() onTaskAdded;

  const AddTaskInput({
    super.key,
    required this.todoController,
    required this.todos,
    required this.onTaskAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: todoController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Adicionar tarefa",
              hintText: "Ex: Estudar Flutter",
            ),
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            String text = todoController.text;
            if (text.isNotEmpty) {
              todos.add(Task(
                text: text,
                createdAt: DateTime.now(),
              ));

              todoController.clear();
              onTaskAdded();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff00d7f3),
            padding: EdgeInsets.all(14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
