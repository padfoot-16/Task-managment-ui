// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:managmentui/constants/colors.dart';

class Task {
  IconData? icondata;
  String? title;
  Color? bgcolor;
  Color? iconcolor;
  Color? btncolor;
  num? left;
  num? done;
  bool islast;
  Task({
    this.icondata,
    this.title,
    this.bgcolor,
    this.iconcolor,
    this.btncolor,
    this.left,
    this.done,
    this.islast=false,
  });
  static List<Task> generateTasks(){
    return [
      Task(
        icondata: Icons.person_rounded,
        title: "Personal",
        bgcolor: kYellowLight,
        iconcolor: kYellowDark,
        btncolor: kYellow,
        left: 3,
        done: 1,
      ),
      Task(
        icondata: Icons.cases,
        title: "Work",
        bgcolor: kRedLight,
        iconcolor: kRedDark,
        btncolor: kRed,
        left: 0,
        done: 1,
      ),
      Task(
        icondata: Icons.favorite_rounded,
        title: "Health",
        bgcolor: kBlueLight,
        iconcolor: kBlueDark,
        btncolor: kBlue,
        left: 0,
        done: 0,
      ),
      Task(islast: true)
    ];
  }
}
