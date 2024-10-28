import 'package:flutter/material.dart';
import 'package:managmentui/View/detail/detail.dart';
import '../models/tasks_model.dart';
import 'package:dotted_border/dotted_border.dart';

class Tasks extends StatelessWidget {
  final List<Category> categories;

  const Tasks({required this.categories, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) =>
            categories[index].islast ? _buildAddTask() : _buildTask(context, categories[index]),
      ),
    );
  }

  Widget _buildAddTask() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(20),
      dashPattern: [10, 10],
      color: Colors.grey,
      strokeWidth: 1,
      child: Center(
        child: Text(
          '+ Add',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTask(BuildContext context, Category task) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailPage(task)),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 10),
        decoration: BoxDecoration(
          color: task.bgcolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(task.icondata, color: task.iconcolor, size: 35),
            SizedBox(height: 30),
            Text(
              task.title ?? '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTaskStatus(task.btncolor ?? Colors.white, task.iconcolor ?? Colors.black, '${task.left} left'),
                SizedBox(width: 5),
                _buildTaskStatus(Colors.white, task.iconcolor ?? Colors.black, '${task.done} done'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskStatus(Color bgColor, Color textColor, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
