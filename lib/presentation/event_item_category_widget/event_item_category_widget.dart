import 'package:flutter/material.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/providers/event_item_provider/model/event_category_filter.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import '../../theme/styles_text.dart';

class EventItemCategoryWidget extends StatelessWidget {
  final List<Item>  listFilters;
  final Function checkedItem;
  final Function sendFilterItem;
  final String keys;
  const EventItemCategoryWidget({
    super.key, 
    required this.listFilters,
    required this.checkedItem,
    required this.sendFilterItem,
    required this.keys
    });

  @override
  Widget build(BuildContext context) {
      return Container(
          decoration: MyBoxDecoration.bottomModal,
          height: MediaQuery.of(context).size.height / 1.2,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
               height: MediaQuery.of(context).size.height / 1.5,
                child: ListView.builder(
                    itemCount: listFilters.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int idx) {
                      Item listItem = listFilters[idx];
                      return InkWell(
                          onTap: () {
                            checkedItem(listItem, keys);
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: <Widget>[
                                Expanded(
                                    child: Text(listItem.value.toString(),
                                        style: ThemeText.w18b,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis)),
                                Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                        shape: CircleBorder(),
                                        checkColor: Colors.white,
                                        activeColor: CustomColors.cyan,
                                        value: listItem.isChecked,
                                        onChanged: (bool? value) {
                                          checkedItem(listItem,keys);
                                        })),
                              ])));
                    }),
              ),
              Container(
        decoration: MyBoxDecoration.ticketButton,
        child: ElevatedButton(
          onPressed: () {
            sendFilterItem();
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // Make button transparent
            shadowColor: Colors.transparent, // Remove shadow
          ),
          child: Text(S.current.selected, style: ThemeText.w16b),
        ),
      ),
            ],
          ));
    }
}
