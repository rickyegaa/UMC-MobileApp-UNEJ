import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:umc_mobile/constant/default_padding.dart';
import 'package:umc_mobile/constant/image_assets.dart';
import 'package:umc_mobile/constant/textstyle.dart';
import 'package:umc_mobile/feature/auth/screen/main_auth.dart';

import '../../constant/color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ClipPath(
              clipper: BottomRoundedClipper(),
              child: Container(
                height: 132,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppImages.profilePattern,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Image.asset(
                      AppImages.umcLogo,
                      width: 100,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'AKUN',
                      style: AppTextStyle.textStyle20w700
                          .copyWith(color: AppColors.putih),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  username,
                  style: AppTextStyle.textStyle12W700
                      .copyWith(color: AppColors.abu5),
                ),
                Text(
                  '202411920193',
                  style: AppTextStyle.textStyle12W700
                      .copyWith(color: AppColors.abu5),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultPadding),
              padding: EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 18,
              ),
              decoration: BoxDecoration(
                color: AppColors.putih,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  buildItem(context, AppImages.settingProfile, 'Pengaturan'),
                  buildItem(
                      context, AppImages.verifProfile, 'Masa aktif mahasiswa'),
                  buildItem(
                      context, AppImages.privasiProfile, ' Kebijakan privasi'),
                  buildItem(context, AppImages.lockProfile, 'Ganti password'),
                  buildItem(context, AppImages.faqProfile, 'FAQ'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: MainAuth(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.merah,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  "Keluar",
                  style: AppTextStyle.textStyle16w400
                      .copyWith(color: AppColors.putih),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildItem(BuildContext context, String image, String name) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(image),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyle.textStyle14W400.copyWith(
                  letterSpacing: 2,
                  fontWeight: FontWeight.w600,
                  color: AppColors.abu5),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 212 / 314,
              height: 1,
              color: AppColors.hitam1.withOpacity(0.5),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ],
    );
  }
}

class BottomRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(
        0, size.height - 50); // Line to the top-left corner of the rounded part
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height - 50); // Quadratic Bezier curve to create the rounded part
    path.lineTo(size.width, 0); // Line to the bottom-right corner of the widget
    path.close(); // Close the path to create a closed shape

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
