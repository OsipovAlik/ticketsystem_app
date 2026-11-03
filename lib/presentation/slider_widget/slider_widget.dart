import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/screens/event_details/details.dart';
import 'package:ticketsystem/widget/global_cash_img/global_cash_img.dart';
import 'package:ticketsystem/widget/slider_link_status/slider_link_status.dart';

import '../../providers/home_provider/model/banner_model.dart';



class SliderWidget extends StatelessWidget {
 final List<BannerModel> bannerList;
const SliderWidget({ super.key, required this.bannerList });

  @override
  Widget build(BuildContext context){
     return Padding(
       padding: const EdgeInsets.only(left: 8.0,right: 8.0),
       child: CarouselSlider.builder(
        itemCount: bannerList.length,
        itemBuilder: (BuildContext context, int index, int pageViewIndex) {
          BannerModel bannerData = bannerList[index];
          return GestureDetector(
            onTap: (){
              eventId = bannerData.id.toString();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Details(),
                ),
              );
              sliderLinkStatus(context, "");
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1.9,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0), // Add border radius here
                      child:  GlobalCashImg(
                        photo: bannerData.mainImageEvent,
                        fit: BoxFit.cover
                    )),
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          aspectRatio: 1.9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0,
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
        ),
           ),
     );
  }
}