import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/presentation/category_widget/category_widget.dart';
import 'package:ticketsystem/presentation/slider_widget/slider_widget.dart';
import 'package:ticketsystem/screens/profile/profile.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/widget/global_refresh_indecator.dart/global_refresh_indecator.dart';
import 'package:ticketsystem/widget/loading/pagination_loading.dart';
import 'package:ticketsystem/widget/shimmer/event_item_shimmer/event_tem_shimmer.dart';
import 'package:ticketsystem/widget/shimmer/global_shimmer/global_shimmer.dart';
import 'package:ticketsystem/widget/shimmer/slider_shimmer/slider_shimmer.dart';
import '../../presentation/date_widget/date_widget.dart';
import '../../presentation/event_widget/event_widget.dart';
import '../../providers/home_provider/home_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>  with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
final _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
     final provider = Provider.of<HomeProvider>(context, listen: false);
    
    provider.getAllData();
     _scrollController.addListener(() {
      final position = _scrollController.position;
      if (position.pixels >= position.maxScrollExtent - 200) {
        provider.loadMore();
      }
    });
  });

   
  }
@override
  void dispose() {
   _scrollController.dispose();
    super.dispose();
  }
 

  @override
  Widget build(BuildContext context) {
       super.build(context); 
    return Scaffold(
      appBar: _appBar(),
      body: GlobalRefreshIndicator(
        scrollController: _scrollController,
        onRefresh: () async => {
           Provider.of<HomeProvider>(context, listen: false).getAllData()
        },
        child: Column(
          children: [
            Consumer<HomeProvider>(builder: (BuildContext context,
                HomeProvider provider, Widget? child) {
              if (provider.isLoadingCategory) {
                return GlobalShimmer(
                    child: CategoryWidget(
                        getCategory: () {},
                        categoryList: provider.categoryList));
              } else if (provider.categoryList.isEmpty) {
                return const SizedBox.shrink();
              } else {
                return CategoryWidget(
                    getCategory: provider.getAllEvent,
                    categoryList: provider.categoryList);
              }
            }),
            const SizedBox(height: 16),
        
            ///999///SLIDER
            Consumer<HomeProvider>(builder:
                (BuildContext context, HomeProvider provider, Widget? child) {
              if (provider.isLoadingBanner) {
                return const SliderShimmer();
              } else if (provider.bannerList.isEmpty) {
                return const SizedBox.shrink();
              } else {
                return SliderWidget(bannerList: provider.bannerList);
              }
            }),
        
            Consumer<HomeProvider>(builder:
                (BuildContext context, HomeProvider provider, Widget? child) {
              if (provider.isLoadingDate) {
                return GlobalShimmer(
                    child:
                        DateWidget(onTap: () {}, dateList: provider.dateList));
              } else if (provider.dateList.isEmpty) {
                return const SizedBox.shrink();
              } else {
                return DateWidget(
                    onTap: provider.onTapDate, dateList: provider.dateList);
              }
            }),
            const SizedBox(height: 28),
            Consumer<HomeProvider>(builder:
                (BuildContext context, HomeProvider provider, Widget? child) {
              if (provider.isLoadingEvent) {
                return const EventTemShimmer();
              } else if (provider.eventList.isEmpty) {
                return const EventTemShimmer();
              } else {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      EventWidget(
                          eventList: provider.eventList,
                          addFavorite: provider.addFavorite),
                    PaginationLoading(visible: provider.isLoadingPagination)
                    ],
                  ),
                );
              }
            }),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      leadingWidth: 180,
      leading: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Image.asset("lib/assets/images/logo.png"),
      ),
      backgroundColor: CustomColors.blueBold,
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 45,
              width: 45,
              child: IconButton(
                onPressed: (){
                  showRightModal(context);
                }, 
                icon: SvgPicture.asset(
                  height: 30,
                 width: 30,
                  "lib/assets/svg/user.svg",
                  colorFilter: ColorFilter.mode(
                    CustomColors.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                
                ),
            )
          ],
        )
      ],
    );
  }
   void showRightModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      // constraints: MyBoxConstraints.widthFull,
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Profile();
      },
    );
  }
}
