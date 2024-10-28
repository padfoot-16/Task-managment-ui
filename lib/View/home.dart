import 'package:flutter/material.dart';
import 'package:managmentui/View/add_task_dialog.dart';
import 'package:managmentui/models/tasks_model.dart';
import 'package:managmentui/widgets/Tasks.dart';
import 'package:managmentui/View/daily_tasks.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<DailyTasksState> _dailyTasksKey = GlobalKey<DailyTasksState>();
  List<Category> categories = Category.generateTasks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              "Daily Tasks",
              style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          DailyTasks(key: _dailyTasksKey, categories: categories, onRefresh: _refreshDailyTasks),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "Tasks",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Tasks(categories: categories)),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 0,
        backgroundColor: Colors.black,
        onPressed: () {
          showTaskDialog(context).then((_) {
            _dailyTasksKey.currentState?.refreshTasks();
          });
        },
        child: Icon(Icons.add, size: 35, color: Colors.white),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            child: Image.asset("lib/assets/avatar.png"),
          ),
          SizedBox(width: 15),
          Text(
            "Hi, Emma",
            style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        Icon(
          Icons.more_vert_sharp,
          color: Colors.black,
          size: 40,
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 5, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home_rounded)),
            BottomNavigationBarItem(label: "Person", icon: Icon(Icons.person_rounded)),
          ],
        ),
      ),
    );
  }

  void _refreshDailyTasks() {
    setState(() {
      _dailyTasksKey.currentState?.refreshTasks();
    });
  }
}
