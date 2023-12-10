import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umc_mobile/constant/color.dart';
import 'package:umc_mobile/constant/image_assets.dart';
import 'package:umc_mobile/constant/textstyle.dart';

class PageOnboarding extends StatelessWidget {
  const PageOnboarding({
    Key? key,
    required this.image,
    required this.desc,
  }) : super(key: key);

  final String image, desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        SvgPicture.asset(AppImages.umcSplash),
        SizedBox(
          height: 88,
        ),
        DelayedDisplay(
          delay: Duration(milliseconds: 100),
          child: Center(child: SvgPicture.asset(image)),
        ),
        SizedBox(
          height: 72,
        ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text(
            desc,
            style: AppTextStyle.splash.copyWith(
              color: AppColors.putih,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
