import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umc_mobile/constant/color.dart';
import 'package:umc_mobile/constant/image_assets.dart';
import 'package:umc_mobile/feature/auth/screen/main_auth.dart';
import 'package:umc_mobile/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:umc_mobile/feature/onboarding/page/page_onboarding.dart';

class OnboardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<OnboardingBloc>();
    return Scaffold(
      backgroundColor: AppColors.biru1,
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          if (state is OnboardingInitial) {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: PageView(
                      controller: bloc.pageController,
                      onPageChanged: (index) => bloc.add(
                        OnChangeIndex(index: index),
                      ),
                      children: [
                        PageOnboarding(
                          image: AppImages.splash1,
                          desc:
                              'Setiap langkah kecil menuju kesehatan yang lebih baik adalah langkah besar dalam perjalanan hidup. Aplikasi kesehatan adalah panduan di sepanjang jalan.',
                        ),
                        PageOnboarding(
                          image: AppImages.splash2,
                          desc:
                              'Waktu dan kesehatan adalah dua aset berharga yang tidak dikenali dan hargai sampai keduanya hilang',
                        ),
                        PageOnboarding(
                          image: AppImages.splash3,
                          desc:
                              'Pada Saat Kita Sehat Harta Itu Adalah Hal Yang Utama, Tetapi Pada Saat Kita Sakit Harta Itu Tidak Bernilai',
                        ),
                      ],
                    ),
                  ),

                  // * Part of two dot builder and button left and right
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              debugPrint(state.currentIndex.toString());
                              if (state.currentIndex == 2) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => const MainAuth()),
                                );
                                return;
                              }
                              if (state.currentIndex == 0) {
                                bloc.pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.easeInOut);
                                bloc.add(OnChangeIndex(index: 1));
                              }
                              if (state.currentIndex == 1) {
                                bloc.pageController.animateToPage(2,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.easeInOut);
                                bloc.add(OnChangeIndex(index: 2));
                              }
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(AppImages.panahKanan),
                            ),
                          ),
                          DotsIndicator(
                            dotsCount: 3,
                            position: state.currentIndex.toDouble(),
                            decorator: DotsDecorator(
                              color: AppColors.putih,
                              activeColor: AppColors.putih,
                              size: const Size.square(9.0),
                              activeSize: const Size(32, 12.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
