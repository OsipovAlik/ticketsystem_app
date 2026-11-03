import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/styles_text.dart';

import '../../providers/home_provider/model/date_model.dart';



class DateWidget extends StatelessWidget {
  final List<DateModel> dateList;
  final Function onTap;
const DateWidget({ super.key, required this.dateList, required this.onTap });

  @override
  Widget build(BuildContext context){
    return Container(
               alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 16.0,left: 16.0),
                // color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 92,
                child: ListView.builder(
                  itemCount: dateList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemBuilder: (BuildContext context,int idx){
                    DateModel date = dateList[idx];
                      return GestureDetector(
                        onTap: () => onTap(idx,date.startDate),
                        child: Container(
                          decoration: date.isActive? MyBoxDecoration.ticketCyanCard: MyBoxDecoration.ticketCard,
                          alignment: Alignment.center,
                          margin:const EdgeInsets.only(right: 16.0),
                          padding:const EdgeInsets.only(left: 18.0,top: 8.0,right: 18.0),
                          child: Column(
                            children: [
                               Text(date.day, style:  ThemeText.w18b),
                               Text(date.weekday,style:date.isWeekend? ThemeText.r14b:ThemeText.w14b),
                               Text(date.month,style:  ThemeText.w14b),
                         
                            ],
                          ),
                        ),
                      );
                }),
              );
  }
}