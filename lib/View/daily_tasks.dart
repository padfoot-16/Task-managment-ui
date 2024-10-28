import 'package:flutter/material.dart';
import 'package:managmentui/models/task_tile.dart';
import 'package:managmentui/models/tasks_model.dart';

class DailyTasks extends StatefulWidget {
  final VoidCallback onRefresh;
  final List<Category> categories;

  const DailyTasks({super.key, required this.onRefresh, required this.categories});

  @override
  DailyTasksState createState() => DailyTasksState();
}

class DailyTasksState extends State<DailyTasks> {
  List<Task> dailyTasks = [];

  @override
  void initState() {
    super.initState();
    _updateDailyTasks();
  }

  void _updateDailyTasks() {
    DateTime today = DateTime.now();
    List<Task> tasks = [];
    for (var category in widget.categories) {
      if (category.tasks != null) {
        for (var task in category.tasks!) {
          if (task.dueDate != null &&
              task.dueDate!.year == today.year &&
              task.dueDate!.month == today.month &&
              task.dueDate!.day == today.day) {
            tasks.add(task);
          }
        }
      }
    }
    setState(() {
      dailyTasks = tasks;
    });
  }

  Color? getTaskCategoryBackgroundColor(Task task) {
    for (var category in widget.categories) {
      if (category.tasks?.contains(task) ?? false) {
        return category.bgcolor;
      }
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height / 3.7,
      child: ListView.builder(
        itemCount: dailyTasks.length,
        itemBuilder: (context, index) {
          final task = dailyTasks[index];
          return TaskTile(
            title: task.title,
            color: getTaskCategoryBackgroundColor(task),
            done: task.isdone,
          );
        },
      ),
    );
  }

  void refreshTasks() {
    _updateDailyTasks();
  }
}
