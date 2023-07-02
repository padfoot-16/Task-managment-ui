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
  List<Map<String,dynamic>>? desc;
  bool islast;
  Task({
    this.icondata,
    this.title,
    this.bgcolor,
    this.iconcolor,
    this.btncolor,
    this.left,
    this.done,
    this.desc,
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
        desc: [
          {'time':'9:00 am',
            'title':'finish The managment ui',
            'slot':'9:00 - 10:00 am',
            'tlcolor':kRedDark,
            'bgcolor':kRedLight,
          },
          {'time':'10:00 am',
            'title':'Read the book',
            'slot':'10:00 - 11:00 am',
            'tlcolor':kBlueDark,
            'bgcolor':kBlueLight,
            },
            {'time':'11:00 am',
            'title':' ',
            'slot':'',
            'tlcolor':kBlueDark,
            'bgcolor':Colors.white
            },
            {'time':'12:00 am',
            'title':' ',
            'slot':'',
            'tlcolor':Colors.grey.withOpacity(0.3),
            'bgcolor':Colors.white
            },
            {'time':'1:00 pm',
            'title':'Call with clients ',
            'slot':'1:00 - 2:00 pm',
            'tlcolor':kYellowDark,
            'bgcolor':kYellowLight,
            },
            {'time':'2:00 pm',
            'title':' ',
            'slot':'',
            'tlcolor':Colors.grey.withOpacity(0.3),
            'bgcolor':Colors.white
            },
            {'time':'3:00 pm',
            'title':' ',
            'slot':'',
            'tlcolor':Colors.grey.withOpacity(0.3),
            'bgcolor':Colors.white
            },
            
        ]
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
