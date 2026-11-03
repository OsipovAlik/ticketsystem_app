import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ticketsystem/providers/event_details_provider/model/event_details_model.dart';
import '../../../widget/global_cash_img/global_cash_img.dart';


class PhotoSlider extends StatelessWidget {
 final List<PerformersModel> bannerList;
const PhotoSlider({ super.key, required this.bannerList });

  @override
  Widget build(BuildContext context){
    return Padding(
       padding: const EdgeInsets.all(8.0),
       child: CarouselSlider.builder(
        itemCount: bannerList.length,
        itemBuilder: (BuildContext context, int index, int pageViewIndex) {
          PerformersModel bannerData = bannerList[index];
          
          return GestureDetector(
            onTap: (){
              // sliderLinkStatus(context, "");
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1.6,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0), // Add border radius here
                      child: GlobalCashImg(
                        photo: bannerData.image,
                        fit: BoxFit.cover
                    )),
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          aspectRatio: 1.6,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
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