

import 'package:flutter/material.dart';
import 'package:managmentui/models/tasks_model.dart';
import 'package:managmentui/screens/detail/widgets/datepicker.dart';

class DetailPage extends StatelessWidget {
  final Task task;

   DetailPage( this.task);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:CustomScrollView(
        slivers: [
          _buildAppbar(context),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Datepicker()
              ]) ,
            ),
          )
        ],
      ) ,
    );
  }

  Widget _buildAppbar(BuildContext context){
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed:()=> Navigator.of(context).pop(),
       icon: Icon(Icons.arrow_back_ios,size: 30,)),
       actions: [
        Icon(Icons.more_vert,size: 40,),
       ],
       flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('${task.title} tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox(height: 5,),
          Text('You have ${task.left} tasks for today',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700]
          ),)
        ]),
       ),
    );

  }
}