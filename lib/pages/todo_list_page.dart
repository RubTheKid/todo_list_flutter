import 'package:flutter/material.dart';
import 'package:todo_list/components/tasks_list.dart';
import '../components/add_task_input.dart';
import '../components/task_summary.dart';
import '../models/task.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();
  List<Task> todos = []; // Lista de Task

  // Função para atualizar a interface ao adicionar uma tarefa
  void onTaskAdded() {
    setState(() {}); // Atualiza a UI
  }

  // Função para deletar uma tarefa
  void onDeleteTask(int index) {
    setState(() {
      todos.removeAt(index); // Remove a tarefa da lista
    });
  }

  // Função para limpar todas as tarefas
  void clearAllTasks() {
    setState(() {
      todos.clear(); // Limpa todas as tarefas da lista
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 64),
                AddTaskInput(
                  todoController: todoController,
                  todos: todos,
                  onTaskAdded: onTaskAdded,
                ),
                SizedBox(height: 16),
                TasksList(
                  todos: todos,
                  onDeleteTask: onDeleteTask,
                ),
                SizedBox(height: 16),
                TaskSummary(
                  todos: todos,
                  onClearAll: clearAllTasks,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
