import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';

class ProfileBtnCard extends StatelessWidget {
  final String svgIcon;
  final double height;
  final double width;
  final String title;
  const ProfileBtnCard({
    super.key, 
    required this.svgIcon, 
    required this.title,
    this.height = 25,
    this.width = 25, 
    });

  final arrowSvg = 'lib/assets/svg/arrow.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                  width: width,
                  height: height,
                  svgIcon,
                  colorFilter: ColorFilter.mode(
                    CustomColors.textPrimary, // Inactive color
                    BlendMode.srcIn,
                  )),
              SizedBox(width: 16),
              Text(title, style: ThemeText.w16b)
            ],
          ),
          SvgPicture.asset(
              width: 25,
              height: 25,
              arrowSvg,
              colorFilter: ColorFilter.mode(
                CustomColors.textPrimary, // Inactive color
                BlendMode.srcIn,
              ))
        ],
      ),
    );
  }
}
