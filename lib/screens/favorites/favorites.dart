import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/presentation/event_widget/event_widget.dart';
import 'package:ticketsystem/providers/favorite_provider/favorite_provider.dart';
import 'package:ticketsystem/providers/profile_provider/profile_provider.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/global_refresh_indecator.dart/global_refresh_indecator.dart';
import 'package:ticketsystem/widget/shimmer/event_item_shimmer/event_tem_shimmer.dart';
import '../../widget/shimmer/favorite_empty_shimmer/favorite_empty_shimmer.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  FavoritesState createState() => FavoritesState();
}

class FavoritesState extends State<Favorites> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FavoriteProvider>(context, listen: false).getFavorite();
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
        title: Text(S.current.favorite, style: ThemeText.w16b),
      ),
      backgroundColor: CustomColors.blueBold,
      body: GlobalRefreshIndicator(
        onRefresh: () async {
          Provider.of<FavoriteProvider>(context, listen: false).getFavorite();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: CustomColors.blueBold,
          child: Consumer<FavoriteProvider>(builder: (BuildContext context,
              FavoriteProvider provider, Widget? widget) {
            if (provider.isVisible) {
              return const EventTemShimmer();
            } else if (provider.list.isEmpty) {
              return const FavoriteEmptyShimmer();
            } else {
              return EventWidget(
                  eventList: provider.list, addFavorite: provider.addFavorite);
            }
          }),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: guest,
        child: Container(
          margin: EdgeInsets.only(left: 32.0, right: 32, bottom: 50),
          height: 50,
          decoration: MyBoxDecoration.ticketButton,
          child: ElevatedButton(
            onPressed: () {
              Provider.of<ProfileProvider>(context, listen: false).signIn(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Text(S.current.sign_in, style: ThemeText.w16b),
          )
        ),
      ),
    );
  }
}
