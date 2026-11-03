import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/presentation/event_item_category_widget/event_item_category_widget.dart';
import 'package:ticketsystem/presentation/event_item_widget/event_item_widget.dart';
import 'package:ticketsystem/presentation/event_widget/event_widget.dart';
import 'package:ticketsystem/providers/category_provider/category_provider.dart';
import 'package:ticketsystem/providers/event_item_provider/event_item_provider.dart';
import 'package:ticketsystem/providers/event_item_provider/model/event_category_filter.dart';
import 'package:ticketsystem/theme/box_width.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
// import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/empty_card/emty_ticket/empty_ticket.dart';
import 'package:ticketsystem/widget/global_refresh_indecator.dart/global_refresh_indecator.dart';
import 'package:ticketsystem/widget/my_chip/my_chip.dart';
import 'package:ticketsystem/widget/shimmer/event_item_shimmer/event_tem_shimmer.dart';
import '../../widget/event_filter_btn/event_filter_btn.dart';

class EventItem extends StatefulWidget {
  const EventItem({super.key});
  @override
  EventItemState createState() => EventItemState();
}

class EventItemState extends State<EventItem> {
  bool bottomSheetEnabled = false;
  late DateTime? start;
  late DateTime? end;

  
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EventItemProvider>(context, listen: false).getAllData();
      Provider.of<CategoryProvider>(context, listen: false).getCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 80,
        backgroundColor: CustomColors.blueBold,
        centerTitle: true,
        // title: Text(S.current.tickets, style: ThemeText.w18b),
      ),
      backgroundColor: CustomColors.blueBold,
      body: GlobalRefreshIndicator(
        onRefresh: () async {
          Provider.of<EventItemProvider>(context, listen: false).getAllData();
        },
        child: Container(
          margin: EdgeInsets.only(top: 16.0),
          width: MediaQuery.of(context).size.width,
          color: CustomColors.blueBold,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 26,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 16,
                    children: [
                      SizedBox(),
                      Consumer<EventItemProvider>(
                          builder: (context, provider, widget) {
                        if (provider.startDate.isEmpty) {
                          return EventFilterBtn(
                              title: S.current.date,
                              onTap: () {
                                _openDateRangePicker(context, provider);
                              });
                        } else {
                          return MyChip(
                            title: "${provider.startDay} - ${provider.endDay}",
                            onOpen: () {
                              _openDateRangePicker(context, provider);
                            },
                            onDelete: () {
                              categoryListIdEvenItem.clear();
                              provider.clearDateFilter();
                            },
                          );
                        }
                      }),
                      Consumer<CategoryProvider>(
                          builder: (context, provider, widget) {
                        if (provider.categorySelectName.isEmpty) {
                          return EventFilterBtn(
                              title: S.current.category,
                              onTap: () {
                                showModalCategory(context);
                              });
                        } else {
                          return MyChip(
                            title: provider.categorySelectName,
                            onOpen: () {
                              showModalCategory(context);
                                // provider.clearSelectedName(context);
                            },
                            onDelete: () {
                              final providerItem =  Provider.of<EventItemProvider>(context,listen: false);
                              categoryListIdEvenItem.clear();
                              provider.clearSelectedName(context);
                              providerItem.clearData();
                              providerItem.getAllData();
                                
                            },
                          );
                        }
                      }),
                      
                      Consumer<EventItemProvider>(
                          builder: (context, provider, child) {
                        if (provider.eventFilterItems.isEmpty) {
                          return SizedBox.shrink();
                        } else {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: provider.eventFilterItems.length,
                                itemBuilder: (context, index) {
                                  EventCategoryFilter filterList = provider.eventFilterItems[index];
                                  if(filterList.key == "place"){
                                    return Container(
                                    margin: EdgeInsets.only(right: 16.0),
                                    child: provider.place.isNotEmpty? MyChip(
                                      title: filterList.name, 
                                      onOpen: (){
                                          showModalCategoryFilter(context, filterList,filterList.key);
                                      }, 
                                 
                                      onDelete: (){
                                        for(var i = 0; i< filterList.items.length;i++){
                                           filterList.items[i].isChecked = false;
                                        }
                                        provider.clearFilter(filterList.key);
                                      }):
                                    
                                    EventFilterBtn(
                                        title: filterList.name,
                                        onTap: () {
                                          showModalCategoryFilter(context, filterList,filterList.key);
                                        }),
                                  );
                                  }else if(filterList.key == "theater"){
                                  return Container(
                                    margin: EdgeInsets.only(right: 16.0),
                                    child: provider.theather.isNotEmpty? MyChip(
                                      title: filterList.name, 
                                      onOpen: (){
                                          showModalCategoryFilter(context, filterList,filterList.key);
                                      }, 
                                 
                                      onDelete: (){
                                         for(var i = 0; i< filterList.items.length;i++){
                                           filterList.items[i].isChecked = false;
                                        }
                                        provider.clearFilter(filterList.key);
                                      }):
                                    
                                    EventFilterBtn(
                                        title: filterList.name,
                                        onTap: () {
                                          showModalCategoryFilter(context, filterList,filterList.key);
                                        }),
                                  );
                                  }else if(filterList.key == "city"){
                                     return Container(
                                    margin: EdgeInsets.only(right: 16.0),
                                    child: provider.city.isNotEmpty? MyChip(
                                      title: filterList.name, 
                                      onOpen: (){
                                          showModalCategoryFilter(context, filterList,filterList.key);
                                      }, 
                                 
                                      onDelete: (){
                                         for(var i = 0; i< filterList.items.length;i++){
                                           filterList.items[i].isChecked = false;
                                        }
                                        provider.clearFilter(filterList.key);
                                      }):
                                    
                                    EventFilterBtn(
                                        title: filterList.name,
                                        onTap: () {
                                          showModalCategoryFilter(context, filterList,filterList.key);
                                        }),
                                  );
                                  }
                                  return SizedBox.shrink();
                                }),
                          );
                        }
                      }),
                      // Consumer<EventItemProvider>(
                      //     builder: (context, provider, child) {
                      //   if (provider.place.isEmpty) {
                      //     return SizedBox.shrink();
                      //   } else {
                
                      //     return
                      //   }
                      // }),
                    ],
                  ),
                ),
              ),
              Consumer<EventItemProvider>(builder: (BuildContext context,
                  EventItemProvider provider, Widget? child) {
                if (provider.isVisible) {
                  return const EventTemShimmer();
                } else if (provider.list.isEmpty) {
                  return const EmptyTicket();
                } else {
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: EventWidget(
                        eventList: provider.list,
                        addFavorite: provider.addFavorite),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  // /MODAL  Date
  void _openDateRangePicker(
      BuildContext context, EventItemProvider provider) async {
    final DateTime today = DateTime.now();
    final selectedRange = await showDateRangePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      useRootNavigator: false,
      context: context,
      initialDateRange: DateTimeRange(
        start: provider.startDateTime,
        end: provider.startEndTime,
      ),
      firstDate: today, // Prevent past dates
      lastDate: today.add(const Duration(days: 220)), // Limit to a future range
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: CustomColors.cyan,
              onPrimary: Colors.white,
              onSurface: Colors.white,
            ),
            datePickerTheme: DatePickerThemeData(
              backgroundColor: CustomColors.blueBold,
              dayForegroundColor: MaterialStateProperty.all(Colors.white),
              todayForegroundColor:
                  MaterialStateProperty.all(CustomColors.blueBold),
              rangePickerBackgroundColor:
                  CustomColors.blueBold.withOpacity(0.1),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedRange != null) {
      provider.dateFilter(selectedRange.start, selectedRange.end);
    }
  }

  // /MODAL  Date
  void showModalCategory(BuildContext context) async {
    bottomSheetEnabled = true;
    if (bottomSheetEnabled) {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        constraints: MyBoxConstraints.widthFull,
        useRootNavigator: false,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          bottomSheetEnabled = false;
          return SingleChildScrollView(child: const EventItemWidget());
        },
      ).whenComplete(() => bottomSheetEnabled = true);
    } else {
      bottomSheetEnabled = true;
    }
  }

  // /MODAL  Date
  void showModalCategoryFilter(
      BuildContext context, EventCategoryFilter listFilters, String keys) async {
    bottomSheetEnabled = true;
    if (bottomSheetEnabled) {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        constraints: MyBoxConstraints.widthFull,
        useRootNavigator: false,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          bottomSheetEnabled = false;
          return Consumer<EventItemProvider>(
            builder: (context, provider, child) {
              return EventItemCategoryWidget(
                  listFilters: listFilters.items,
                  keys: keys,
                  checkedItem: provider.checkedItem,
                  sendFilterItem: provider.sendFilterItem);
            },
          );
        },
      ).whenComplete(() => bottomSheetEnabled = true);
    } else {
      bottomSheetEnabled = true;
    }
  }
}
 // SizedBox(
                                    //   width: MediaQuery.of(context).size.width / 1.6,
                                    //   height: 40,
                                    //   child: ListView.builder(
                                    //       shrinkWrap: true,
                                    //       physics: NeverScrollableScrollPhysics(),
                                    //       scrollDirection: Axis.horizontal,
                                    //       itemCount: provider.place.length,
                                    //       itemBuilder: (context, index) {
                                    //         return Container(
                                    //           margin: EdgeInsets.only(right: 16.0),
                                    //           child: EventFilterBtn(
                                    //               title: provider.place[index],
                                    //               onTap: () {}),
                                    //         );
                                    //       }),
                                    // )