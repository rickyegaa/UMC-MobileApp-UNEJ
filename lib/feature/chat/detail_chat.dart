import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umc_mobile/components/custom_textfield.dart';
import 'package:umc_mobile/constant/default_padding.dart';
import 'package:umc_mobile/constant/image_assets.dart';
import 'package:umc_mobile/constant/textstyle.dart';
import 'package:umc_mobile/feature/chat/bloc/chat_bloc.dart';
import 'package:umc_mobile/model/chat_model.dart';

import '../../constant/color.dart';
import '../../model/dokter_model.dart';

class DetailChat extends StatelessWidget {
  const DetailChat({super.key, required this.model});

  final DokterModel model;

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ChatBloc>();
    List<ChatModel> getChatDokter() {
      List<ChatModel> chatDokter = [];
      switch (model.image) {
        case AppImages.dokter1:
          chatDokter = bloc.chatDokter1;
          break;
        case AppImages.dokter2:
          chatDokter = bloc.chatDokter2;
          break;
        case AppImages.dokter3:
          chatDokter = bloc.chatDokter3;
          break;
        default:
      }
      return chatDokter;
    }

    String getDokter() {
      String dokter = '';
      switch (model.image) {
        case AppImages.dokter1:
          dokter = 'dokter1';
          break;
        case AppImages.dokter2:
          dokter = 'dokter2';
          break;
        case AppImages.dokter3:
          dokter = 'dokter3';
          break;
        default:
      }
      return dokter;
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.hitam3,
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Image.asset(model.image),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name,
                        style: AppTextStyle.textStyle16w400.copyWith(
                          color: AppColors.biru2,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        model.role,
                        style: AppTextStyle.textStyle10w700.copyWith(
                          color: AppColors.hitam2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: AppColors.hitam1.withOpacity(0.5),
              ),
              Expanded(
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    if (state is ChatInitial) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 7.2 / 10,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                final data = getChatDokter()[index];
                                return getChatDokter().isNotEmpty
                                    ? Align(
                                        alignment: data.isUser
                                            ? Alignment.centerRight
                                            : Alignment.centerLeft,
                                        child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: data.isUser
                                                  ? AppColors.biru1
                                                      .withOpacity(0.5)
                                                  : AppColors.putih,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              border: Border.all(
                                                width: 2,
                                                color: AppColors.hitam3
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                            child: Text(data.chat)),
                                      )
                                    : SizedBox();
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 16,
                                );
                              },
                              itemCount: getChatDokter().length),
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ChatTextField(
                  controller: bloc.chatC,
                  onKeyboardOpen: () {
                    print('success');
                  },
                  onTap: () {
                    debugPrint('State 1');
                    debugPrint('State 5' + getDokter());
                    bloc.add(OnSendChat(dokter: getDokter()));
                    debugPrint('State 2');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
