import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/providers/profile_provider/profile_provider.dart';
import 'package:ticketsystem/routes/animated_navigate.dart';
import 'package:ticketsystem/screens/profile/settings/settings.dart';
import 'package:ticketsystem/screens/profile/terms_condition/terms_condition.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/profile_btn_card/profile_btn_card.dart';
import 'package:ticketsystem/widget/shimmer/global_shimmer/global_shimmer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        toolbarHeight: 170,
        backgroundColor: CustomColors.blueBold,
        centerTitle: true,
        title: Text(S.current.profile, style: ThemeText.w18b)
      ),
      backgroundColor: CustomColors.blueBold,
      body: Container(
        margin: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        color: CustomColors.blueBold,
        child: Consumer<ProfileProvider>(builder:
            (BuildContext context, ProfileProvider provider, Widget? widget) {
          if (provider.isLoading) {
            return GlobalShimmer(child: Text("...load"));
          } else if (provider.list.isNotEmpty) {
            return Text("...empty");
          } else {
            return GestureDetector(
              onTap: () {
                provider.picImage();
              },
              child: Column(
                children: [
                  Visibility(
                    visible: !guest,
                    child: Container(
                      decoration: MyBoxDecoration.castWidth1,
                      padding: EdgeInsets.all(8.0),
                      height: 120,
                      width: 120,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: provider.userImg != null
                            ? FileImage(provider.userImg as File)
                            // ignore: unnecessary_null_comparison
                            : (photoPath != null && photoPath.isNotEmpty
                                    ? NetworkImage(photoPath)
                                    : const AssetImage(
                                        'lib/assets/images/tickets.png'))
                                as ImageProvider<Object>,
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  Visibility(
                    visible: !guest,
                    child: Text(name, style: ThemeText.w18b)),
                  SizedBox(height: 18),
                  Visibility(
                    visible: !guest,
                    child: Text(phone, style: ThemeText.w16b)),
                  SizedBox(height: 68),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(createOpacityTransition(const Settings()));
                        },
                        child: ProfileBtnCard(
                          title: S.current.settings,
                          svgIcon: "lib/assets/svg/setting.svg",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              createOpacityTransition(const TermsCondition()));
                        },
                        child: ProfileBtnCard(
                          title: S.current.terms,
                          width: 20,
                          height: 20,
                          svgIcon: "lib/assets/svg/terms.svg",
                        ),
                      ),
                      // ProfileBtnCard(
                      //   svgIcon: "lib/assets/svg/setting.svg",
                      //   onTap: (){
                      //    Navigator.of(context).push(createOpacityTransition(const Settings()));
                      //  })
                    ],
                  )
                ],
              ),
            );
          }
        }),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 32.0, right: 32, bottom: 50),
        height: 50,
        decoration: MyBoxDecoration.ticketButton,
        child: guest ? ElevatedButton(
          onPressed: () {
            Provider.of<ProfileProvider>(context, listen: false).signIn(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: Text(S.current.sign_in, style: ThemeText.w16b),
        ): ElevatedButton(
          onPressed: () {
            Provider.of<ProfileProvider>(context, listen: false).signOut(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: Text(S.current.sign_out, style: ThemeText.w16b),
        ),
      ),
    );
  }
}
