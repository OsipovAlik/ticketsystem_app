import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/providers/category_provider/category_provider.dart';
import 'package:ticketsystem/providers/category_provider/model/category_model.dart';
import 'package:ticketsystem/providers/event_item_provider/event_item_provider.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_colors.dart';

import '../../global/global.dart';
import '../../theme/styles_text.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, provider, child) {
      return Container(
          decoration: MyBoxDecoration.bottomModal,
          height: MediaQuery.of(context).size.height / 1.2,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              itemCount: provider.categoryList.length,
              shrinkWrap: true,
              clipBehavior: Clip.none,
              itemBuilder: (BuildContext context, int idx) {
                CategoryModel data = provider.categoryList[idx];
                return InkWell(
                    onTap: () {
                     
                       Navigator.of(context).pop();
                       categoryListIdEvenItem.clear();
                       provider.clearSelectedName(context);
                       Provider.of<EventItemProvider>(context,listen: false).clearAllFiltrList();
                        provider.checkedFilter(data);
                       categoryListIdEvenItem.add(data.id);

                        Provider.of<EventItemProvider>(context, listen: false).getAllData();
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: Text(data.name,
                                  style: ThemeText.w18b,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis)),
                          Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                  shape: CircleBorder(),
                                  checkColor: Colors.white,
                                  activeColor: CustomColors.cyan,
                                  value: data.isActive,
                                  onChanged: (bool? value) {
                                    provider.checkedFilter(data);
                                    Navigator.of(context).pop();
                                  })),
                        ])));
              }));
    });
  }
}
