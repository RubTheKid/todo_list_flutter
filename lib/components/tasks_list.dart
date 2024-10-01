import 'package:flutter/material.dart';
import '../models/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> todos;
  final Function(int) onDeleteTask;

  const TasksList({
    super.key,
    required this.todos,
    required this.onDeleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: todos.length,
        itemBuilder: (context, index) {
          Task task = todos[index];

          return Dismissible(
            key: Key(task.text),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              onDeleteTask(index);


              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${task.text} foi removida')),
              );
            },
            child: ListTile(
              title: Text(task.text),
              subtitle: Text(
                'Adicionada em: ${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year} ${task.createdAt.hour}:${task.createdAt.minute}',
              ),
            ),
          );
        },
      ),
    );
  }
}
