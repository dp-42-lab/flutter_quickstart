import 'package:flutter/material.dart';
import 'package:flutter_quickstart/shared/theme/color.utils.dart';
import 'package:toastification/toastification.dart';

import '../../../../theme/typography.utils.dart';
import '../../svg_icon.enum.dart';
import '../../svg_icon.widget.dart';

class ToastMessage {
  static void showSuccess(BuildContext context, String msg) {
    toastification.show(
      type: ToastificationType.success,
      icon: SvgIcon(iconName: SvgIconType.info, color: context.onPrimaryContainer, size: 24),
      foregroundColor: context.onPrimaryContainer,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      primaryColor: context.primaryContainer,
      showProgressBar: false,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      borderRadius: BorderRadius.circular(4),
      closeButton: const ToastCloseButton(showType: CloseButtonShowType.none),
      closeOnClick: true,
      title: Text(msg, style: AppTextStyle.decorativeTextRegular(fontSize: 16).setColor(context.onPrimaryContainer)),
    );
  }

  /* void showError(String? msg) {
      toastification.show(
        type: ToastificationType.error,
        foregroundColor: AppColors.danger.main,
        style: ToastificationStyle.fillColored,
        alignment: Alignment.topCenter,
        primaryColor: AppColors.primary.main,
        showProgressBar: false,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        borderRadius: BorderRadius.circular(8),
        closeButtonShowType: CloseButtonShowType.none,
        closeOnClick: true,
        description: RichText(text: TextSpan(text: msg ?? 'Oops, something went Wrong.', style: TextStyles.textStyleRegular(fontSize: 12).setColor(AppColors.danger.main))),
      );
    }*/
}
