import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/config/config_language.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/providers/app_state_provider/app_state_provider.dart';
import 'package:ticketsystem/providers/language_provider/language_provider.dart';
import 'package:ticketsystem/providers/profile_provider/profile_provider.dart';
import 'package:ticketsystem/services/services.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/utils/restart_widget/restart_widget.dart';
import 'package:ticketsystem/widget/app_bar_ticket/app_bar_ticket.dart';
import 'package:ticketsystem/widget/language_card/language_card.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  String selectedOption = "en";
  String selectedEng = "1";
  bool _lightsPush = false;

  /// CHANGE  RADIO BUTTONS VALUE
  void handleRadioValueChanged(String value, String valuId) {
    selectedEng = valuId;
    selectedOption = value;
  }

  void _changeLanguage() {
    globalLanguage = selectedOption;
    globalEng = selectedEng;
    Services.setLang(globalLanguage);
    context.read<LanguageProvider>().changeLocale(globalLanguage);
    context.read<AppStateProvider>().resetNavigatorKeys();
    RestartWidget.restartApp(context);
  }

  

  @override
  void initState() {
    for (var language in languages) {
      language.visible = (language.value == globalLanguage);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTicket(context: context, title: S.current.settings),
      backgroundColor: CustomColors.blueBold,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 22.0),
            height: 50,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Center(
              child: ListView.separated(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: languages.length,
                itemBuilder: (context, idx) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        handleRadioValueChanged(
                            languages[idx].value, languages[idx].valueId);
                        final selectedValueId = languages[idx].valueId;
                        for (var language in languages) {
                          language.visible =
                              (language.valueId == selectedValueId);
                        }
                      });
                    },
                    child: LanguageCard(
                      visible: languages[idx].visible,
                      image: languages[idx].image,
                      name: languages[idx].name,
                      value: languages[idx].value,
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox(width: 8), // Adjust spacing here
              ),
            ),
          ),
          SizedBox(height: 100),
          Visibility(
            visible: !guest,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 22,
                children: [
                  // _darkMode(context),
                  // SizedBox(height: 12),
                  // _biometrics(context),
                  // SizedBox(height: 12),
                  _pushNotification(context),
                  GestureDetector(
                      onTap: () {
                        _removeAccount();
                      },
                      child:
                          Text(S.current.remove_account, style: ThemeText.w18b))
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 32.0, right: 32, bottom: 50),
        height: 50,
        decoration: MyBoxDecoration.ticketButton,
        child: ElevatedButton(
          onPressed: _changeLanguage,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: Text(S.current.change_language, style: ThemeText.w16b),
        ),
      ),
    );
  }

  Future<void> _removeAccount() async {
    final provider = Provider.of<ProfileProvider>(context,listen: false);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: CustomColors.blueBold,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const SizedBox(
                    height: 18), // Customize your dialog content here
                Text(S.current.account_removal,
                    style: ThemeText.w20b, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                Text(
                  S.current.are_you_remove_you_want,
                  style: ThemeText.w16,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      child: Text(S.current.close, style: ThemeText.w14b),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                 provider.onLoading? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      backgroundColor: CustomColors.blueBold,
                      color: CustomColors.cyan,
                    ),
                  ):  TextButton(
                      onPressed: (){
                        provider.removeMyAccount(context);
                      },
                      child: Text(S.current.remove, style: ThemeText.r14b),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // Widget _darkMode(BuildContext context) {
  //   return SizedBox(
  //     width: MediaQuery.sizeOf(context).width,
  //     // color: CustomColors.blueLight,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(S.current.color_mode, style: ThemeText.w18b),
  //         Transform.scale(
  //           scale: 0.9, // Adjust the scale to increase/decrease size
  //           child: Switch(
  //               value: _lightsDark,
  //               onChanged: (bool value) {
  //                 setState(() {
  //                   _lightsDark = value;
  //                 });
  //               },
  //               activeColor:
  //                   CustomColors.cyan, // Color of the thumb when active
  //               activeTrackColor: CustomColors
  //                   .blueLight, // Background track color when active
  //               inactiveThumbColor:
  //                   Colors.white, // Color of the thumb when inactive
  //               inactiveTrackColor: CustomColors.blueLight),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget _biometrics(BuildContext context) {
  //   return SizedBox(
  //     width: MediaQuery.sizeOf(context).width,
  //     // color: CustomColors.blueLight,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(S.current.biometric, style: ThemeText.w18b),
  //         Transform.scale(
  //           scale: 0.9, // Adjust the scale to increase/decrease size
  //           child: Switch(
  //               value: _lightsBiometric,
  //               onChanged: (bool value) {
  //                 setState(() {
  //                   _lightsBiometric = value;
  //                 });
  //               },
  //               activeColor:
  //                   CustomColors.cyan, // Color of the thumb when active
  //               activeTrackColor: CustomColors
  //                   .blueLight, // Background track color when active
  //               inactiveThumbColor:
  //                   Colors.white, // Color of the thumb when inactive
  //               inactiveTrackColor: CustomColors.blueLight),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _pushNotification(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      // color: CustomColors.blueLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(S.current.push_notif, style: ThemeText.w18b),
          Transform.scale(
            scale: 0.9,
            child: Switch(
              value: _lightsPush,
              onChanged: (bool value) {
                setState(() {
                  _lightsPush = value;
                });
              },
              activeColor: CustomColors.cyan,
              activeTrackColor: CustomColors.blueLight,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: CustomColors.blueLight,
            ),
          )
        ],
      ),
    );
  }
}
