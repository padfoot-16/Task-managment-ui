// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:managmentui/widgets/Tasks.dart';

import '../widgets/go_premium.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildappbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gopremium(),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "Tasks",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Tasks()),
        ],
      ),
      bottomNavigationBar: _buildbottomnavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 0,
        backgroundColor: Colors.black,
        onPressed: (){

        },
        child: Icon(Icons.add,size: 35,),),
    );
  }

  Widget _buildbottomnavbar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10)
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Colors.blueAccent,
                unselectedItemColor: Colors.grey.withOpacity(0.5),
                items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home_rounded)),
                BottomNavigationBarItem(
                  label: "Person",
                  icon: Icon(Icons.person_rounded))
              ]),
      ),
    );
  }

  AppBar _buildappbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            child: Image(image: AssetImage('lib/assets/images/avatar.png')),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "Hi, Emma",
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        Icon(
          Icons.more_vert_sharp,
          color: Colors.black,
          size: 40,
        )
      ],
    );
  }
}
