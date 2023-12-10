import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:umc_mobile/components/custom_textfield.dart';
import 'package:umc_mobile/constant/color.dart';
import 'package:umc_mobile/constant/default_padding.dart';
import 'package:umc_mobile/constant/image_assets.dart';
import 'package:umc_mobile/constant/textstyle.dart';
import 'package:umc_mobile/feature/chat/detail_chat.dart';
import 'bloc/cari_dokter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<CariDokterBloc>();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(defaultPadding),
          children: [
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'konsultasi'.toUpperCase(),
                style: AppTextStyle.textStyle20w700
                    .copyWith(color: AppColors.abu4),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFieldWithSearch(
              onChanged: (value) {
                bloc.add(OnCariDokter());
              },
              controller: bloc.cariDokterC,
              width: 2,
              hintText: 'dokter',
            ),
            SizedBox(
              height: 12,
            ),
            BlocBuilder<CariDokterBloc, CariDokterState>(
              builder: (context, state) {
                if (state is CariDokterInitial) {
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: AppColors.hitam1.withOpacity(0.5),
                      );
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.models.length,
                    itemBuilder: (context, index) {
                      final data = state.models[index];
                      return ListTile(
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: DetailChat(model: data),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        leading: Image.asset(data.image),
                        title: Text(
                          'dr. ${data.name}',
                          style: AppTextStyle.textStyle16w400.copyWith(
                            color: AppColors.biru2,
                          ),
                        ),
                        subtitle: Text(
                          data.role,
                          style: AppTextStyle.textStyle10w700.copyWith(
                            color: AppColors.hitam2,
                          ),
                        ),
                        trailing: SvgPicture.asset(
                          AppImages.notif,
                          color: index == 2 ? AppColors.abu4 : null,
                        ),
                      );
                    },
                  );
                }
                return SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
