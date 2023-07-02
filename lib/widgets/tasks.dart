// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../models/tasks_model.dart';
import 'package:dotted_border/dotted_border.dart';

class Tasks extends StatelessWidget {
  final tasklist = Task.generateTasks();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:15),
      child: GridView.builder(
        itemCount:tasklist.length ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
           itemBuilder: (context,index) => 
           tasklist[index].islast ? _buildAddtask() : _buildTask(context,tasklist[index])
           ),
    );
  }
  Widget _buildAddtask(){
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(20),
      dashPattern: [10,10],
      color: Colors.grey,
      strokeWidth: 1,
      child:Center(
        child:Text(
          '+ Add',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ) ,) 
      );
  }
  Widget _buildTask(BuildContext context, Task task){
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: task.bgcolor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Icon(task.icondata,
            color: task.iconcolor,
            size: 35,),
            SizedBox(height: 30,),
            Text(task.title!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildtaskstatus(task.btncolor!,task.iconcolor!,'${task.left} left'),
                SizedBox(width: 5),
                _buildtaskstatus(Colors.white, task.iconcolor!, '${task.done} done')
              ],
            ),
        ],
      ),
    );
  }
}
Widget _buildtaskstatus( Color bgcolor,Color textcolor,String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    decoration: BoxDecoration(
      color: bgcolor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(text,
    style: TextStyle(
      color: textcolor
    ),),
  );
}
