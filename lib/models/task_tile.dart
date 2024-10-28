import "package:flutter/material.dart";

class TaskTile extends StatelessWidget {
  String title;
  Color? color;
  bool? done;
  TaskTile({
    super.key,
    required this.title,
    required this.color,
    required this.done,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        color: color,
        child: Row(
          children: [
            Checkbox(value: done, onChanged: (value) {}),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
