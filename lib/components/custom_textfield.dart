import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umc_mobile/constant/image_assets.dart';
import 'package:umc_mobile/constant/textstyle.dart';

import '../constant/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    required this.imageAsset,
    this.textInputAction,
    this.controller,
    this.validator,
    this.obscureText = false,
  });
  final TextEditingController? controller;
  final String? hintText;
  final String imageAsset;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      textInputAction: textInputAction,
      obscuringCharacter: '●',
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Colors.white, // Ubah warna teks error
        ),
        filled: true,
        isDense: true,
        hintText: hintText,
        hintStyle: AppTextStyle.textStyle16w400.copyWith(color: AppColors.abu1),
        contentPadding: EdgeInsets.only(left: 12, top: 12),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
            bottom: 10,
          ),
          child: SvgPicture.asset(
            imageAsset,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 40,
          minHeight: 40,
        ),
        fillColor: AppColors.abu,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.biru1,
          ),
          borderRadius: BorderRadius.circular(40.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.biru1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.biru1,
          ),
        ),
      ),
    );
  }
}

class TextFieldWithSearch extends StatelessWidget {
  const TextFieldWithSearch({
    super.key,
    this.hintText,
    this.textInputAction,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.width = 1,
    this.onChanged,
  });
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final double width;
  final Function(String)? onChanged;

  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Colors.white, // Ubah warna teks error
        ),
        filled: true,
        isDense: true,
        hintText: 'Cari $hintText',
        hintStyle: AppTextStyle.textStyle16w400.copyWith(color: AppColors.abu1),
        contentPadding: EdgeInsets.only(top: 12),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
            bottom: 10,
          ),
          child: SvgPicture.asset(
            AppImages.search,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 60,
          minHeight: 40,
        ),
        fillColor: AppColors.abu,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: width,
            color: width == 1 ? AppColors.biru1 : AppColors.abu1,
          ),
          borderRadius: BorderRadius.circular(40.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            width: width,
            color: width == 1 ? AppColors.biru1 : AppColors.abu1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            width: width,
            color: width == 1 ? AppColors.biru1 : AppColors.abu1,
          ),
        ),
      ),
    );
  }
}

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    this.controller,
    this.onTap,
    this.onKeyboardOpen,
  });
  final Function()? onKeyboardOpen;
  final TextEditingController? controller;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onKeyboardOpen,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Colors.white, // Ubah warna teks error
        ),
        filled: true,
        isDense: true,
        hintText: 'Message',
        hintStyle: AppTextStyle.textStyle16w400.copyWith(color: AppColors.abu1),
        contentPadding: EdgeInsets.only(top: 12),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: SvgPicture.asset(
            AppImages.direct,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: SvgPicture.asset(
              AppImages.send,
            ),
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 60,
          minHeight: 40,
        ),
        fillColor: AppColors.abu,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.abu1,
          ),
          borderRadius: BorderRadius.circular(40.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.abu1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.abu1,
          ),
        ),
      ),
    );
  }
}
