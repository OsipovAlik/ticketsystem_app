import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/presentation/category_search_widget/category_search_widget.dart';
import 'package:ticketsystem/presentation/event_widget/event_widget.dart';
import 'package:ticketsystem/presentation/search_event_widget/search_event_widget.dart';
import 'package:ticketsystem/providers/category_provider/category_provider.dart';
import 'package:ticketsystem/providers/home_provider/home_provider.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/shimmer/global_shimmer/global_shimmer.dart';
import 'package:ticketsystem/widget/shimmer/search_ampty/search_ampty.dart';
import 'package:ticketsystem/widget/shimmer/slider_shimmer/slider_shimmer.dart';
import '../../widget/global_refresh_indecator.dart/global_refresh_indecator.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search>  {
  TextEditingController searchText = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CategoryProvider>(context, listen: false).getCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blueBold,
        centerTitle: true,
        title: _searchTitle(),
      ),
      backgroundColor: CustomColors.blueBold,
      body: GlobalRefreshIndicator(
        onRefresh: () async {
          Provider.of<CategoryProvider>(context, listen: false).getCategory();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 18.0),
          color: CustomColors.blueBold,
          child: Consumer<HomeProvider>(builder:
              (BuildContext context, HomeProvider provider, Widget? widget) {
            if (provider.isLoadingEvent) {
              return GlobalShimmer(child: Text(""));
            } else if (provider.search.isNotEmpty) {
              return provider.eventList.isNotEmpty
                  ? SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: EventWidget(
                          eventList: provider.eventList,
                          // animationController: _animationController,
                          addFavorite: provider.addFavorite),
                    )
                  : const SearchAmpty();
            } else {
              return Container(
                padding: EdgeInsets.only(left: 18.0,right: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Consumer<HomeProvider>(builder: (BuildContext context,
                        HomeProvider provider, Widget? child) {
                      if (provider.isLoadingBanner) {
                        return const SliderShimmer();
                      } else if (provider.bannerList.isEmpty) {
                        return const SizedBox.shrink();
                      } else {
                        return SearchEventWidget(dateList: provider.bannerList);
                      }
                    }),
                    const SizedBox(height: 25),
                    Text(S.current.category, style: ThemeText.w18b),
                    const SizedBox(height: 16),
                    Consumer<CategoryProvider>(builder: (BuildContext context,
                        CategoryProvider provider, Widget? widget) {
                      if (provider.isLoading) {
                        return GlobalShimmer(
                            child: CategorySearchWidget(
                              selectedCategory:(){},
                              categoryList: provider.categoryList));
                      } else if (provider.categoryList.isEmpty) {
                        return const SizedBox.shrink();
                      } else {
                        return CategorySearchWidget(
                          categoryList: provider.categoryList,
                          selectedCategory: provider.checkedFilter
                            
                          );
                      }
                    })
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }

  Widget _searchTitle() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 12),
      alignment: Alignment.center,
      height: 50,
      // decoration: MyBoxDecoration.searchBox,
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextFormField(
             cursorColor: CustomColors.textPrimary,
              enableInteractiveSelection: true,
              textInputAction: TextInputAction.done,
              // autofocus: true,
              controller: searchText,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0), //
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor:  CustomColors.blueLight,
                  hintText: S.current.search_menu_iteam,
                  hintStyle: ThemeText.w12b),
              onChanged: (value) {
                Provider.of<HomeProvider>(context, listen: false).searchList(value);
              }),
          Positioned(
            right: 5,
            child: Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: Provider.of<HomeProvider>(context, listen: true).search.isNotEmpty,
              child: IconButton(
                onPressed: () {
                  Provider.of<HomeProvider>(context, listen: false).removeSearch();
                  searchText.clear();
                },
                icon: Icon(
                  Icons.close,
                  size: 22,
                  color: CustomColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
