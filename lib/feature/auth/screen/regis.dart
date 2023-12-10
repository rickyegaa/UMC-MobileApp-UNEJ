import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umc_mobile/components/custom_snackbar.dart';
import 'package:umc_mobile/components/custom_textfield.dart';
import 'package:umc_mobile/constant/color.dart';
import 'package:umc_mobile/constant/default_padding.dart';
import 'package:umc_mobile/constant/image_assets.dart';
import 'package:umc_mobile/constant/textstyle.dart';
import 'package:umc_mobile/feature/auth/bloc/regis/regis_bloc.dart';

class RegisPage extends StatelessWidget {
  const RegisPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RegisBloc>();
    return Scaffold(
      backgroundColor: AppColors.biru1,
      body: SafeArea(
        child: Center(
          child: BlocConsumer<RegisBloc, RegisState>(
            listener: (context, state) {
              if (state is RegisInitial) {
                switch (state.status) {
                  case RegisStatus.erorr:
                    SnackbarHelper.showSnackbar(context,
                        message: state.errorMessage,
                        snackBarType: SnackBarType.error);
                    break;
                  case RegisStatus.success:
                    SnackbarHelper.showSnackbar(context,
                        message: 'Berhasil membuat akun',
                        snackBarType: SnackBarType.success);
                    bloc.add(ClearEvent());
                    Navigator.of(context).pop();
                    break;
                  default:
                }
              }
            },
            builder: (context, state) {
              if (state is RegisInitial) {
                return Form(
                  key: bloc.formKey,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      SvgPicture.asset(
                        AppImages.umcSplash,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Buat akun',
                        style: AppTextStyle.textStyle24W700
                            .copyWith(color: AppColors.putih),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Silahkan masukan username dan password anda untuk membuat akun...',
                        style: AppTextStyle.textStyle14W400.copyWith(
                          color: AppColors.putih,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field ini tidak boleh kosong';
                          }
                          if (value.length < 8) {
                            return 'Minimal 8 karakter';
                          }
                          if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                              .hasMatch(value)) {
                            return 'Harus mengandung kombinasi huruf dan angka';
                          }
                          return null;
                        },
                        controller: bloc.usernameC,
                        imageAsset: AppImages.user,
                        hintText: 'Username',
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field ini tidak boleh kosong';
                          }
                          if (value.length < 8) {
                            return 'Minimal 8 karakter';
                          }

                          return null;
                        },
                        obscureText: true,
                        controller: bloc.passwordC,
                        imageAsset: AppImages.lock,
                        hintText: 'Password',
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      UnconstrainedBox(
                        child: SizedBox(
                          width: 140,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: AppColors.merah,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                            onPressed: () {
                              if (state.status != RegisStatus.loading) {
                                if (bloc.formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  bloc.add(OnRegisEvent());
                                }
                              }
                            },
                            child: state.status == RegisStatus.loading
                                ? CircularProgressIndicator()
                                : Text('Login'),
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
        ),
      ),
    );
  }
}
