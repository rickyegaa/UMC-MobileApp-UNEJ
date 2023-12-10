import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umc_mobile/components/custom_textfield.dart';
import 'package:umc_mobile/constant/color.dart';
import 'package:umc_mobile/constant/default_padding.dart';
import 'package:umc_mobile/constant/image_assets.dart';
import 'package:umc_mobile/constant/textstyle.dart';
import 'package:umc_mobile/feature/home/bloc/home_bloc.dart';
import 'package:umc_mobile/feature/home/widgets/konten_atas.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeBloc>();
    return Scaffold(body: SafeArea(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: AppColors.biru1,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        40,
                      ),
                      bottomRight: Radius.circular(
                        40,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          AppImages.umcLogo,
                          width: 100,
                        ),
                      ),
                      Text(
                        'Hai, $username'.toUpperCase(),
                        style: AppTextStyle.textStyle24W700
                            .copyWith(color: AppColors.abu2),
                      ),
                      Text(
                        'Mahasiswa Universitas Jember',
                        style: AppTextStyle.textStyle12W500
                            .copyWith(color: AppColors.abu2),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      TextFieldWithSearch(
                        hintText: 'berita',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      KontenAtasHome(
                          alignmentGeometry: Alignment.topCenter,
                          color: AppColors.abu3),
                      KontenAtasHome(
                          alignmentGeometry: Alignment.bottomCenter,
                          color: AppColors.biruTabAktif),
                      KontenAtasHome(
                          alignmentGeometry: Alignment.topCenter,
                          color: AppColors.abu3),
                      KontenAtasHome(
                          alignmentGeometry: Alignment.bottomCenter,
                          color: AppColors.biruTabAktif),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          bloc.add(OnChangeIndex(index: 0));
                          bloc.pageController.animateToPage(0,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeInOut);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration:
                              state.currentIndex == 0 ? aktifIndex() : null,
                          child: Text(
                            'Semua',
                            style: state.currentIndex == 0
                                ? AppTextStyle.textStyle12W700
                                    .copyWith(color: AppColors.putih)
                                : AppTextStyle.textStyle12W400
                                    .copyWith(color: AppColors.hitam1),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          bloc.add(OnChangeIndex(index: 1));
                          bloc.pageController.animateToPage(1,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeInOut);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration:
                              state.currentIndex == 1 ? aktifIndex() : null,
                          child: Text(
                            'Tips sehat',
                            style: state.currentIndex == 1
                                ? AppTextStyle.textStyle12W700
                                    .copyWith(color: AppColors.putih)
                                : AppTextStyle.textStyle12W400
                                    .copyWith(color: AppColors.hitam1),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          bloc.add(OnChangeIndex(index: 2));
                          bloc.pageController.animateToPage(2,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeInOut);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration:
                              state.currentIndex == 2 ? aktifIndex() : null,
                          child: Text(
                            'Gaya hidup',
                            style: state.currentIndex == 2
                                ? AppTextStyle.textStyle12W700
                                    .copyWith(color: AppColors.putih)
                                : AppTextStyle.textStyle12W400
                                    .copyWith(color: AppColors.hitam1),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          bloc.add(OnChangeIndex(index: 3));
                          bloc.pageController.animateToPage(3,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeInOut);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration:
                              state.currentIndex == 3 ? aktifIndex() : null,
                          child: Text(
                            'Berita',
                            style: state.currentIndex == 3
                                ? AppTextStyle.textStyle12W700
                                    .copyWith(color: AppColors.putih)
                                : AppTextStyle.textStyle12W400
                                    .copyWith(color: AppColors.hitam1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: bloc.pageController,
                    onPageChanged: (value) {
                      bloc.add(
                        OnChangeIndex(index: value),
                      );
                    },
                    children: [
                      ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Image.asset(
                                AppImages.kontenHome,
                                fit: BoxFit.contain,
                              ));
                        },
                      ),
                      ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Image.asset(
                                AppImages.kontenHome,
                                fit: BoxFit.contain,
                              ));
                        },
                      ),
                      ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Image.asset(
                                AppImages.kontenHome,
                                fit: BoxFit.contain,
                              ));
                        },
                      ),
                      ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Image.asset(
                                AppImages.kontenHome,
                                fit: BoxFit.contain,
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    ));
  }

  BoxDecoration aktifIndex() {
    return BoxDecoration(
      color: AppColors.biruTabAktif,
      borderRadius: BorderRadius.circular(15),
    );
  }
}
