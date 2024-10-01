import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskSummary extends StatelessWidget {
  final List<Task> todos;
  final VoidCallback onClearAll;

  const TaskSummary({
    super.key,
    required this.todos,
    required this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text("Você possui ${todos.length} tarefas pendentes."),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: onClearAll,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff00d7f3),
            padding: EdgeInsets.all(14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Limpar tudo',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
