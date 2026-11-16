import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/presentation/category_widget/category_widget.dart';
import 'package:ticketsystem/presentation/cinemas_widget/cinemas_widget.dart';
import 'package:ticketsystem/presentation/cities_widget/cities_widget.dart';
import 'package:ticketsystem/presentation/slider_widget/slider_widget.dart';
import 'package:ticketsystem/screens/event_item/event_item.dart';
import 'package:ticketsystem/screens/profile/profile.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/widget/global_refresh_indecator.dart/global_refresh_indecator.dart';
import 'package:ticketsystem/widget/loading/pagination_loading.dart';
import 'package:ticketsystem/widget/shimmer/event_item_shimmer/event_tem_shimmer.dart';
import 'package:ticketsystem/widget/shimmer/global_shimmer/global_shimmer.dart';
import 'package:ticketsystem/widget/shimmer/search_ampty/search_ampty.dart';
import 'package:ticketsystem/widget/shimmer/slider_shimmer/slider_shimmer.dart';
import '../../presentation/date_widget/date_widget.dart';
import '../../presentation/event_widget/event_widget.dart';
import '../../providers/home_provider/home_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
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
        onRefresh: () async => {Provider.of<HomeProvider>(context, listen: false).getAllData()},
        child: Consumer<HomeProvider>(
          builder: (BuildContext context, HomeProvider provider, Widget? child) {
            if (provider.search.isNotEmpty) {
              // Searching: hide browse sections (category/banner/date) and
              // show only the search field plus matching events, same as
              // the Search tab.
              return Column(
                children: [
                  const SizedBox(height: 12),
                  _searchBar(provider),
                  const SizedBox(height: 16),
                  if (provider.isLoadingEvent)
                    const EventTemShimmer()
                  else if (provider.eventList.isEmpty)
                    const SearchAmpty()
                  else
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: EventWidget(eventList: provider.eventList, addFavorite: provider.addFavorite),
                    ),
                ],
              );
            }
            return Column(
              children: [
                const SizedBox(height: 12),
                _searchBar(provider),
                const SizedBox(height: 16),
                if (provider.isLoadingCategory)
                  GlobalShimmer(child: CategoryWidget(getCategory: () {}, categoryList: provider.categoryList))
                else if (provider.categoryList.isEmpty)
                  const SizedBox.shrink()
                else
                  CategoryWidget(getCategory: provider.getAllEvent, categoryList: provider.categoryList),
                const SizedBox(height: 16),

                ///999///SLIDER
                if (provider.isLoadingBanner)
                  const SliderShimmer()
                else if (provider.bannerList.isEmpty)
                  const SizedBox.shrink()
                else
                  SliderWidget(bannerList: provider.bannerList),
                const SizedBox(height: 24),

                if (!provider.isLoadingCinemaVenues) ...[
                  CinemasWidget(
                    cinemas: provider.cinemas,
                    onToggle: provider.toggleCinemaFilter,
                    onSeeAll: () => _openAdvancedSearch(context),
                  ),
                  if (provider.cinemas.isNotEmpty) const SizedBox(height: 24),
                ],
                if (!provider.isLoadingFilters) ...[
                  CitiesWidget(
                    cities: provider.cities,
                    onToggle: provider.toggleCityFilter,
                    onSeeAll: () => _openAdvancedSearch(context),
                  ),
                  if (provider.cities.isNotEmpty) const SizedBox(height: 24),
                ],

                if (provider.isLoadingDate)
                  GlobalShimmer(child: DateWidget(onTap: () {}, dateList: provider.dateList))
                else if (provider.dateList.isEmpty)
                  const SizedBox.shrink()
                else
                  DateWidget(onTap: provider.onTapDate, dateList: provider.dateList),
                const SizedBox(height: 28),
                if (provider.isLoadingEvent)
                  const EventTemShimmer()
                else if (provider.eventList.isEmpty)
                  const EventTemShimmer()
                else
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      children: [
                        EventWidget(eventList: provider.eventList, addFavorite: provider.addFavorite),
                        PaginationLoading(visible: provider.isLoadingPagination)
                      ],
                    ),
                  ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _searchBar(HomeProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextFormField(
              cursorColor: CustomColors.textPrimary,
              enableInteractiveSelection: true,
              textInputAction: TextInputAction.done,
              controller: provider.searchController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: CustomColors.blueLight,
                  hintText: S.current.search_menu_iteam,
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 128, 128, 150), fontSize: 12)),
              onChanged: (value) {
                provider.searchList(value);
              }),
          Positioned(
            right: 5,
            child: Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: provider.search.isNotEmpty,
              child: IconButton(
                onPressed: () {
                  provider.removeSearch();
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

  PreferredSizeWidget _appBar() {
    return AppBar(
      leadingWidth: 180,
      leading: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Image.asset("lib/assets/images/logo.webp"),
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
                onPressed: () {
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

  void _openAdvancedSearch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EventItem()),
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
