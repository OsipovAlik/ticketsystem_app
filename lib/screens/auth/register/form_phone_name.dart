import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/providers/auth_provider/auth_provider.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import '../../../theme/custom_colors.dart';

class FormPhoneName extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;
  final Function validator;
  final Function onChange;
  final bool isError;
  const FormPhoneName(
      {super.key,
      required this.nameController,
      required this.phoneController,
      required this.validator,
      required this.onChange,
      required this.formKey,
      required this.isError});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return phoneNumberSend(context, provider);
    });
  }

  ///widget ui auth page
  Widget phoneNumberSend(BuildContext context, AuthProvider provider) {
    int numberLength = countryCode == "374" ? 8 : 12;
    return Form(
        key: formKey,
        child: Column(
          spacing: 22,
          children: <Widget>[
          Row(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Container(
              height: 48,
              decoration: MyBoxDecoration.inputBox,
              child: TextButton(
                  onPressed: () {
                    openCountryCode(context);
                  },
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "+ $countryCode", style: ThemeText.w16),
                        const WidgetSpan(child: SizedBox(width: 16)),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(Icons.keyboard_arrow_down,
                                color: CustomColors.textPrimary, size: 16))
                      ]))),
            ),
            Expanded(
                child: TextFormField(
                    textInputAction: TextInputAction.done,
                    style: TextStyle(color: CustomColors.textPrimary),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(numberLength),
                    ],
                    validator: (value) {
                      // Validate that the length is exactly 8 digits
                      if (value == null || value.length != numberLength) {
                        validator();
                        return '';
                      }
                      return null;
                    },
                    onChanged: (val) {
                     onChange();
                    },
                    enableInteractiveSelection: false,
                    controller: phoneController,
                    cursorColor: CustomColors.textPrimary,
                    decoration: InputDecoration(
                      fillColor: CustomColors.inputBlue.withOpacity(0.6),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12.0), // Rounded corners
                        borderSide: BorderSide.none, // No visible border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                            color:isError?Colors.red:CustomColors.blue,
                            width: 1.0), // Border color and width
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                            color: isError?Colors.red:CustomColors.blue,
                            width: 1.0), // Border for focused state
                      ),
                      hintText: S.current.phone_number,
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintStyle: ThemeText.g14,
                    )))
          ]),

         TextFormField(
              textInputAction: TextInputAction.done,
              style: TextStyle(color: CustomColors.textPrimary),
              keyboardType: TextInputType.text,
              enableInteractiveSelection: false,
              controller: nameController,
              cursorColor: CustomColors.textPrimary,
              decoration: InputDecoration(
                fillColor: CustomColors.inputBlue.withOpacity(0.6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                  borderSide: BorderSide.none, // No visible border
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(
                      color: CustomColors.blue,
                      width: 1.0), // Border color and width
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(
                      color: CustomColors.blue,
                      width: 1.0), // Border for focused state
                ),
                hintText: S.current.last_name,
                contentPadding: const EdgeInsets.only(left: 20),
                hintStyle: ThemeText.g14,
              )
              ),
        ]));
  }

  void openCountryCode(BuildContext context) {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        onSelect: (Country country) {
          countryCode = country.phoneCode;
          onChange();
        },
        countryListTheme: CountryListThemeData(
          flagSize: 20,
          backgroundColor: CustomColors.blueBold,
          bottomSheetHeight: MediaQuery.of(context).size.height * 0.79,
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          inputDecoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: CustomColors.cyan),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 252, 248, 248)))),
        ));
  }
}
