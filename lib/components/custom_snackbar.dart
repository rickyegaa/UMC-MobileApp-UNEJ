import 'package:flutter/material.dart';

import '../constant/color.dart';

enum SnackBarType { success, warning, error }

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    super.key,
    Duration? duration,
    Color? backgroundColor,
    required String content,
    SnackBarType? snackBarType,
  }) : super(
          content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: const TextStyle(
                    color: AppColors.putih,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat'),
              ),
            ),
            if (snackBarType != null) const SizedBox(width: 8.0),
            if (snackBarType == SnackBarType.success)
              const Icon(
                Icons.check_circle_rounded,
                color: AppColors.putih,
                size: 18.0,
              ),
            if (snackBarType == SnackBarType.warning)
              const Icon(
                Icons.warning,
                color: AppColors.putih,
                size: 18.0,
              ),
            if (snackBarType == SnackBarType.error)
              const Icon(
                Icons.error,
                color: AppColors.putih,
                size: 18.0,
              ),
          ]),
          duration: duration ?? const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          backgroundColor: backgroundColor ??
              (snackBarType == SnackBarType.success
                  ? Colors.green
                  : snackBarType == SnackBarType.warning
                      ? Colors.yellow
                      : snackBarType == SnackBarType.error
                          ? AppColors.merah
                          : null),
        );
}

class SnackbarHelper {
  static void showSnackbar(BuildContext context,
      {required String message,
      Duration? duration,
      SnackBarType? snackBarType}) {
    /// Menghapus semua snackbar yang ada dalam scaffold.
    ScaffoldMessenger.of(context).clearSnackBars();

    /// Menampilkan snackbar baru.
    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
      content: message,
      duration: duration,
      snackBarType: snackBarType,
    ));
  }
}
