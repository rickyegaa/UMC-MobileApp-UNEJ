import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umc_mobile/components/custom_snackbar.dart';
import 'package:umc_mobile/components/custom_textfield.dart';
import 'package:umc_mobile/constant/color.dart';
import 'package:umc_mobile/constant/default_padding.dart';
import 'package:umc_mobile/constant/image_assets.dart';
import 'package:umc_mobile/constant/textstyle.dart';
import 'package:umc_mobile/feature/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:umc_mobile/feature/auth/screen/regis.dart';
import 'package:umc_mobile/feature/navbar/navbar.dart';

class MainAuth extends StatelessWidget {
  const MainAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<AuthBloc>();
    return Scaffold(
      backgroundColor: AppColors.biru1,
      body: SafeArea(
        child: Center(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthInitial) {
                switch (state.status) {
                  case AuthStatus.error:
                    SnackbarHelper.showSnackbar(context,
                        message: 'Username atau password anda salah',
                        snackBarType: SnackBarType.error);
                    break;
                  case AuthStatus.success:
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Navbar(username: bloc.usernameC.text),
                      ),
                      (route) =>
                          false, // Kondisi untuk menghapus semua halaman di atas
                    );

                    break;
                  default:
                }
              }
            },
            builder: (context, state) {
              if (state is AuthInitial) {
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
                        height: 64,
                      ),
                      SvgPicture.asset(
                        AppImages.splash4,
                      ),
                      SizedBox(
                        height: 72,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field ini tidak boleh kosong';
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
                        controller: bloc.passwordC,
                        imageAsset: AppImages.lock,
                        hintText: 'Password',
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Lupa password?',
                          style: AppTextStyle.splash
                              .copyWith(color: AppColors.putih),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      BuatAkun(),
                      SizedBox(
                        height: 49 - 16,
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
                              if (state.status != AuthStatus.loading) {
                                if (bloc.formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();

                                  bloc.add(OnLoginEvent());
                                }
                              }
                            },
                            child: state.status == AuthStatus.loading
                                ? CircularProgressIndicator()
                                : Text('Login'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Versi 1.0.0',
                          style: AppTextStyle.versi
                              .copyWith(color: AppColors.putih),
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

class BuatAkun extends StatefulWidget {
  const BuatAkun({super.key});

  @override
  State<BuatAkun> createState() => _BuatAkunState();
}

class _BuatAkunState extends State<BuatAkun> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<AuthBloc>();
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
            text: 'Belum punya akun? ',
            style: AppTextStyle.splash.copyWith(color: AppColors.putih),
            children: <TextSpan>[
              TextSpan(
                  text: 'Buat akun',
                  style: AppTextStyle.splash.copyWith(
                    color: AppColors.putih,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.putih,
                    decorationThickness: 2,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const RegisPage()),
                      );
                      bloc.add(ClearEvent());
                    }),
            ]),
      ),
    );
  }
}
