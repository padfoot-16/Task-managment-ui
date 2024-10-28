import 'package:flutter/material.dart';
import 'package:managmentui/constants/colors.dart';

class Category {
  IconData? icondata;
  String? title;
  Color? bgcolor;
  Color? iconcolor;
  Color? btncolor;
  num left;
  num done;
  List<Task>? tasks;
  bool islast;

  Category({
    this.icondata,
    this.title,
    this.bgcolor,
    this.iconcolor,
    this.btncolor,
    this.left=0,
    this.done=0,
    this.tasks,
    this.islast = false,
  });
   void addTask(Task task) {
    tasks?.add(task);
    left++; // Increment the number of remaining tasks
  }

  void removeTask(Task task) {
    tasks?.remove(task);
    left--; // Decrement remaining tasks when removed
  }

  static List<Category>? _taskList;

  static List<Category> generateTasks() {
    if (_taskList == null) {
      _taskList = [
        Category(
          icondata: Icons.person_rounded,
          title: "Personal",
          bgcolor: kYellowLight,
          iconcolor: kYellowDark,
          btncolor: kYellow,
          left: 0,
          done: 0,
          tasks: [],
        ),
        Category(
          icondata: Icons.cases,
          title: "Work",
          bgcolor: kRedLight,
          iconcolor: kRedDark,
          btncolor: kRed,
          left: 0,
          done: 0,
          tasks: [],
        ),
        Category(
          icondata: Icons.favorite_rounded,
          title: "Health",
          bgcolor: kBlueLight,
          iconcolor: kBlueDark,
          btncolor: kBlue,
          left: 0,
          done: 0,
          tasks: [],
        ),
        Category(islast: true),
      ];
    }
    return _taskList!;
  }
}

class Task {
  String title;
  String? subt;
  DateTime? dueDate;
  bool? isdone = false;

  Task({
    required this.title,
    this.subt,
    this.dueDate,
    this.isdone,
  });
}
