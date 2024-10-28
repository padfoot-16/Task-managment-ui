import 'package:flutter/material.dart';
import 'package:managmentui/models/tasks_model.dart';
import 'package:table_calendar/table_calendar.dart';

class Tasktimeline extends StatefulWidget {
  final Category category;

  Tasktimeline({required this.category});

  @override
  State<Tasktimeline> createState() => _TasktimelineState();
}

class _TasktimelineState extends State<Tasktimeline> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime today = DateTime.now();
  List<Task> selectedDayTasks = [];
  List<Category> categories = Category.generateTasks();

  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      selectedDayTasks = _getTasksForToday(day);
      print("Selected day: $day, Tasks: $selectedDayTasks");
    });
  }

  List<Task> _getTasksForToday(DateTime day) {
    return widget.category.tasks?.where((task) {
      return task.dueDate != null &&
          task.dueDate!.year == day.year &&
          task.dueDate!.month == day.month &&
          task.dueDate!.day == day.day;
    }).toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          TableCalendar(
            focusedDay: today,
            availableGestures: AvailableGestures.all,
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
            ),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 10, 16),
            onDaySelected: onDaySelected,
            selectedDayPredicate: (day) => isSameDay(day, today),
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              today = focusedDay;
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectedDayTasks.length,
              itemBuilder: (context, index) {
                final task = selectedDayTasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.subt ?? ""),
                  trailing: Text("due: ${task.dueDate!.toLocal()}".split(" ")[0]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
