import 'package:flutter/material.dart';
import 'package:managmentui/models/tasks_model.dart';
import 'package:managmentui/View/detail/widgets/datepicker.dart';
import 'package:managmentui/View/detail/widgets/tasktimeline.dart';
import 'package:managmentui/View/detail/widgets/tasktitle.dart';

class DetailPage extends StatelessWidget {
  final Category category;

  DetailPage(this.category);

  @override
  Widget build(BuildContext context) {
    final detaillist = category.tasks;
    print("Detail page tasks for category ${category.title}: $detaillist");

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _buildAppbar(context),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Datepicker(),
                      Tasktitle(),
                    ],
                  ),
                ),
                detaillist == null || detaillist.isEmpty
                    ? Container(
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            "No Task Today",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Tasktimeline(category: category,),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppbar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${category.title} tasks',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text( category.left == 1 ? "You have 1 Task " :
                  'You have ${category.left} tasks ',
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
