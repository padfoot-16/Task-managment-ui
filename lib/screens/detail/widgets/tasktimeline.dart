

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Tasktimeline extends StatelessWidget {
final Map<String,dynamic> detail;

   Tasktimeline(this.detail);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child:Row(children: [
        _buildtimeline(detail['tlcolor']),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(detail['time']),
              detail['title'].isNotEmpty ?
               _buildcard(detail['bgcolor'],detail['title'],detail['slot']) :
               _buildcard(Colors.white ,'', '')
          ],)
          )
      ]),
    );
  }
  Widget _buildtimeline(Color color){
    return Container(
      height: 80,
      width: 20,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0,
          width: 15,
          indicator: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 5,color: color)
            ),
          )
        ),
        afterLineStyle:LineStyle(
          thickness: 2,
          color: color,
        ) ,
      ),
    );
  }
  Widget _buildcard(Color bgcolor,String title,String slot){
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
        bottomLeft: Radius.circular(10))
      ),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 10,),
        Text(slot),
    ]),
    );
  }
}