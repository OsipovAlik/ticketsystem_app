import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/presentation/event_widget/event_widget.dart';
import 'package:ticketsystem/providers/category_provider/category_provider.dart';
import 'package:ticketsystem/providers/event_details_provider/model/event_details_model.dart';
import 'package:ticketsystem/providers/event_item_provider/event_item_provider.dart';
import 'package:ticketsystem/providers/home_provider/model/event_model.dart';
import 'package:ticketsystem/screens/auth/login/login.dart';
import 'package:ticketsystem/screens/event_chart/event_chart.dart';
import 'package:ticketsystem/screens/event_details/address_map/address_map.dart';
import 'package:ticketsystem/screens/event_details/event_app_bar/event_app_bar.dart';
import 'package:ticketsystem/screens/event_details/performers/performers.dart';
import 'package:ticketsystem/screens/event_details/photo_slider/photo_slider.dart';
import 'package:ticketsystem/screens/event_details/schedule/schedule.dart';
import 'package:ticketsystem/screens/event_item/event_item.dart';
import 'package:ticketsystem/services/api/event/event.dart';
import 'package:ticketsystem/services/api/favorite/favorite.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_buttons.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/shimmer/detail_shimmer/detail_shimmer.dart';
import 'package:ticketsystem/widget/snackbar_util/snackbar_util.dart';
import '../../routes/animated_navigate.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
  bool isVisible = false;
  EventDetailsModel? detailData;
  List<EventModel> eventSimilar = [];
  bool isExpanded = false;
  final Set<dynamic> _favoriteInFlight = {};
  bool _detailsFavoriteInFlight = false;

  Future<void> getEventList() async {
    if (!mounted) return;
    setState(() {
      isVisible = true;
    });
    try {
      Map<String, dynamic> body = {};
      String reqBody = jsonEncode(body);
      final res = await Event.shared.getEventDetails(reqBody);
      setState(() {
        detailData = EventDetailsModel.fromJson(res.resData);
        isVisible = false;
      });
    } catch (err) {
      setState(() {
        detailData = null;
      });
    } 
  }

  Future<void> getEventSimiler() async {
    if (!mounted) return;
    try {
      final res = await Event.shared.getEventSimiler();
      setState(() {
        eventSimilar = EventModel.fromJsonList(res.resData["list"]);
      });
    } catch (err) {
      // setState(() {
      //   detailData = null;
      // });
    }
  }

  Future<void> addFavorite(BuildContext context, EventModel data) async {
    if (!mounted || _favoriteInFlight.contains(data.id)) return;
    _favoriteInFlight.add(data.id);
    setState(() {
      data.isFavorite = !data.isFavorite;
    });

    Map<String, dynamic> body = {"event_id": data.id};
    String reqBody = jsonEncode(body);
    try {
      final res = await Favorite.shared.addFavorite(reqBody);
      if (!mounted) return;
      if (!res.success) {
        setState(() {
          data.isFavorite = !data.isFavorite;
        });

        SnackbarUtil.showSnackbar(context, res.message,
            duration: Duration(milliseconds: 500));
      }
    } catch (err) {
      if (!mounted) return;
      setState(() {
        data.isFavorite = !data.isFavorite;
      });
      SnackbarUtil.showSnackbar(context, S.current.system_error,
          duration: Duration(milliseconds: 500));
    } finally {
      _favoriteInFlight.remove(data.id);
    }
  }

  Future<void> addFavoriteDetails(BuildContext context, EventDetailsModel data) async {
    if(!guest){
      if (!mounted || _detailsFavoriteInFlight) return;
      _detailsFavoriteInFlight = true;
       setState(() {
      data.isFavorite = !data.isFavorite;
    });

    Map<String, dynamic> body = {"event_id": data.id};
    String reqBody = jsonEncode(body);
    try {
      final res = await Favorite.shared.addFavorite(reqBody);
      if (!mounted) return;
      if (!res.success) {
        setState(() {
          data.isFavorite = !data.isFavorite;
        });
        SnackbarUtil.showSnackbar(context, res.message,
            duration: Duration(milliseconds: 500));
      }
    } catch (err) {
      if (!mounted) return;
      setState(() {
        data.isFavorite = !data.isFavorite;
      });

      SnackbarUtil.showSnackbar(context, S.current.system_error,
          duration: Duration(milliseconds: 500));
    } finally {
      _detailsFavoriteInFlight = false;
    }
    }else{
       Navigator.of(context, rootNavigator: true).pushReplacement(
          MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  void textExpanded() {
    if (!mounted) return;
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  ///$$$ UPDATE lIST FAVORITE ITEM NO CALL API $$$///
  void updateProductFavorite(int id) {
    for (var i = 0; i < eventSimilar.length; i++) {
      setState(() {
        if (eventSimilar[i].id == id) {
          eventSimilar[i].isFavorite = false;
        }
      });
    }
  }

  void updateProductFavoriteItem(int id) {
    setState(() {
      if (detailData!.id == id) {
        detailData!.isFavorite = !detailData!.isFavorite;
      }
    });
  }

  Future<void> getChart() async {
    if (!mounted) return;
    setState(() {
      isVisible = true;
    });

    Map<String, dynamic> body = {};
    String reqBody = jsonEncode(body);

    try {
      final res = await Event.shared.getEventDetails(reqBody);
      setState(() {
         detailData = EventDetailsModel.fromJson(res.resData);
         isVisible = false;
      }); 
      getEventSimiler();
    } catch (err) {
      setState(() {
        detailData = null;
         isVisible = false;
      });
    } finally {
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  void initState() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getEventList();
        getEventSimiler();

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (detailData == null) {
      return Container(
          height: MediaQuery.sizeOf(context).height/1.8,
          width: MediaQuery.sizeOf(context).width,
          color: CustomColors.blueBold,
          alignment: Alignment.center,
          child: Center(child: const DetailShimmer()));
    } else {
      return Scaffold(
          body: !isVisible
              ? CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                  slivers: <Widget>[
                    ///slider
                    EventAppBar(
                        data: detailData!, addFavorite: addFavoriteDetails),
                    SliverToBoxAdapter(
                      child: Container(
                        color: CustomColors.blueBold,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _titleTicket(context, detailData!),
                            SizedBox(height: 8.0),
                            _buyTicket(context, detailData!),
                            SizedBox(height: 16.0),
                            Visibility(
                              visible: detailData!.description.isNotEmpty,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(color: CustomColors.blueLight),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.0, right: 16.0),
                                    child: Text(S.current.description.toUpperCase(),
                                        style: ThemeText.c16b),
                                  ),
                                  Divider(color: CustomColors.blueLight),
                                  SizedBox(height: 16.0),
                                  _descriptionTicket(context, detailData!,
                                      isExpanded, textExpanded),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: detailData!.performers.isNotEmpty,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(color: CustomColors.blueLight),
                                  Padding(padding: EdgeInsets.only( left: 16.0, right: 16.0),
                                    child: Text(S.current.photo, style: ThemeText.w16b),
                                  ),
                                  Divider(color: CustomColors.blueLight),
                                  PhotoSlider(bannerList: detailData!.performers)
                                ],
                              ),
                            ),
                            
                            Visibility(
                                visible: detailData!.performers.isNotEmpty,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       SizedBox(height: 16.0),
                                      Text(S.current.cast.toUpperCase(), style: ThemeText.w16b),
                                      Divider(color: CustomColors.blueLight),
                                      Performers(bannerList: detailData!.performers),
                                    ],
                                  ),
                                )),
                                 
                            Visibility(
                              visible: detailData!.timeLine.isNotEmpty,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 16.0),
                                  Divider(color: CustomColors.blueLight),
                                  Padding(
                                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                                      child: Text(S.current.schedule.toUpperCase(), style: ThemeText.w16b)),
                                  Divider(color: CustomColors.blueLight),
                                   SizedBox(height: 16.0),
                                  Schedule(list: detailData!.timeLine),
                              
                                ],
                              ),
                            ),
                           
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8.0),
                                Divider(color: CustomColors.blueLight),
                                Padding(
                                   padding: EdgeInsets.only(left: 16.0, right: 16.0),
                                  child: Text(S.current.add.toUpperCase(), style: ThemeText.w16b),
                                ),
                                Divider(color: CustomColors.blueLight),
                                Padding(
                                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 16.0),
                                      Text(detailData!.thName,
                                      style: ThemeText.w16),
                                  AddressMap(
                                      thName: detailData!.thName,
                                      lat: detailData!.lat,
                                      lng: detailData!.lng)
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                            SizedBox(height: 18.0),
                            Visibility(
                              visible: eventSimilar.isNotEmpty,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(color: CustomColors.blueLight),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.0, right: 16.0),
                                    child: Text(S.current.simelar_event.toUpperCase(),
                                        style: ThemeText.w16b),
                                  ),
                                  Divider(color: CustomColors.blueLight),
                                  SizedBox(height: 8.0),
                                  EventWidget(
                                      eventList: eventSimilar,
                                      addFavorite: addFavorite)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : const DetailShimmer());
    }
  }

  Widget _titleTicket(BuildContext context, EventDetailsModel data) {
    return GestureDetector(
      onTap: (){
            final provider =  Provider.of<CategoryProvider>(context, listen: false);
            final evProvider =  Provider.of<EventItemProvider>(context, listen: false);
                categoryListIdEvenItem.clear();
                categoryListIdEvenItem.add(data.category);
                provider.checkedDetailFilter(data.category,data.categoryName);
                evProvider.checkedPlace(data.thNameKey,data.place);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EventItem(),
                ),
              );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.name, style: ThemeText.w20b),
            Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on,color: CustomColors.textPrimary),
                Flexible(
                  child: Text(data.thName, style: ThemeText.c16b),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buyTicket(BuildContext context, EventDetailsModel data) {
    return Container(
      color: CustomColors.blueLight,
      width: double.infinity,
      padding: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(data.eventDay, style: ThemeText.w56),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.eventMonth, style: ThemeText.w16b),
                  Text(data.eventDayOfWeek, style: !data.isWeekday ? ThemeText.rm16b: ThemeText.w16),
                  Text(data.eventHour, style: ThemeText.w14b),
                ],
              ),
            ],
          ),
          Container(
            decoration: MyBoxDecoration.ticketButton,
            child: ElevatedButton(
              onPressed: () {
                webViewLink = data.url;
                Navigator.of(context)
                    .push(createOpacityTransition(const EventChart()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Make button transparent
                shadowColor: Colors.transparent, // Remove shadow
              ),
              child: Text(S.current.by_ticket.toUpperCase(), style: ThemeText.w14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _descriptionTicket(BuildContext context, EventDetailsModel data,
      bool isExpanded, Function textExpanded) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Html(
              data: data.description,
              style: {
                "*": Style(
                    color: CustomColors.textPrimary,
                    maxLines: isExpanded ? null : 2,
                    // textOverflow: isExpanded ? null : TextOverflow.ellipsis,
                    fontSize: FontSize(16.0),
                    margin: Margins.all(0) // Set the font size here
                    ),
              },
            ),
          ),
          SizedBox(height: 8),
          TextButton(
              style: CustomButtons.readButton,
              onPressed: () {
                textExpanded();
              },
              child: Text(
                  isExpanded ? S.current.read_less : S.current.read_more,
                  style: ThemeText.cUnder)),
        ],
      ),
    );
  }


}
