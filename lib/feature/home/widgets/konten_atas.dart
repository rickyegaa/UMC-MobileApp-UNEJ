import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/color.dart';
import '../../../constant/image_assets.dart';
import '../../../constant/textstyle.dart';

class KontenAtasHome extends StatelessWidget {
  const KontenAtasHome({
    super.key,
    required this.color,
    required this.alignmentGeometry,
  });

  final Color color;
  final AlignmentGeometry alignmentGeometry;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18),
      width: 210,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: alignmentGeometry,
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  ' lorremipsum'.toUpperCase(),
                  style: AppTextStyle.textStyle13W700
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  ' lorremipsum'.toUpperCase(),
                  style: AppTextStyle.textStyle13W700.copyWith(
                      color: AppColors.biru2, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          SvgPicture.asset(AppImages.asuransi),
        ],
      ),
    );
  }
}
