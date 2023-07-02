// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:managmentui/models/tasks_model.dart';
import 'package:managmentui/screens/detail/widgets/datepicker.dart';
import 'package:managmentui/screens/detail/widgets/tasktimeline.dart';
import 'package:managmentui/screens/detail/widgets/tasktitle.dart';

class DetailPage extends StatelessWidget {
  final Task task;

  DetailPage(this.task);

  @override
  Widget build(BuildContext context) {
    final detaillist = task.desc;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildAppbar(context),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Datepicker(),
                    Tasktitle(),
                  ]),
            ),
          ),
          detaillist == null
              ? SliverFillRemaining(
                  child: Container(
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        "No Task Today",
                        style: TextStyle(
                          color: Colors.grey,
                           fontSize: 18),
                      ))),
                )
              : SliverList(
                delegate:SliverChildBuilderDelegate(
                  (_,index)=> Tasktimeline(detaillist[index]),
                  childCount: detaillist.length
                ) ,
                )
        ],
      ),
    );
  }

  Widget _buildAppbar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
          )),
      actions: [
        Icon(
          Icons.more_vert,
          size: 40,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${task.title} tasks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'You have ${task.left} tasks for today',
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              )
            ]),
      ),
    );
  }
}
