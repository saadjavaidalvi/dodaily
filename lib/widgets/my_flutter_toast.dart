import 'dart:ui';
import 'package:do_daily/config/asset_strings.dart';
import 'package:do_daily/config/custom_fonts.dart';
import 'package:do_daily/const_colors.dart';
import 'package:do_daily/widgets/custom_margin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_kit/responsive_kit.dart';

enum ToastType { warning, error, success }

class MyToast {
  Future<bool?> showToast({
    required String msg,
    Toast? toastLength,
    int timeInSecForIosWeb = 1,
    double? fontSize,
    ToastGravity? gravity,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: backgroundColor,
      fontSize: SizeConfig.getMyDynamicFontSize(fontSize ?? 14),
      gravity: gravity,
      textColor: textColor,
      timeInSecForIosWeb: timeInSecForIosWeb,
      toastLength: toastLength,
    );
  }

  Future removeToast() async {
    FToast fToast = FToast();
    await fToast.removeQueuedCustomToasts();
  }

  Future<void> animatedToast(
    BuildContext context, {
    bool removQueueToasts = true,
    String header = '',
    String content = '',
    int duration = 4,
  }) async {
    FToast fToast = FToast();
    fToast.init(context);

    if (removQueueToasts) {
      fToast.removeQueuedCustomToasts();
    }

    final myToast = Container(
      decoration: BoxDecoration(
        color: ConstColors().secondary,
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      padding: Cmargin.symmetric(
        horizontal: 13,
        vertical: 16,
      ),
      width: SizeConfig.screenWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /* Padding(
            padding: Cmargin.only(right: 20),
            child: Image.asset(
              AssetStrings().sentGiff,
              height: SizeConfig.getMyDynamicHeight(47),
              width: SizeConfig.getMyDynamicHeight(47),
              fit: BoxFit.cover,
            ),
          ), */
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  style: CustomTextStyle().body14.copyWith(
                      fontWeight: FontWeight.w800,
                      color: ConstColors().primary),
                ),
                Container(
                  margin: Cmargin.only(bottom: 4),
                ),
                Text(
                  content,
                  style: CustomTextStyle()
                      .body12
                      .copyWith(color: ConstColors().primary),
                )
              ],
            ),
          ),
          Padding(
            padding: Cmargin.only(
              left: 25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    MyToast().removeToast();
                  },
                  child: Icon(
                    Icons.close,
                    size: SizeConfig.getMyDynamicHeight(18),
                    color: ConstColors().primary,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: myToast,
      toastDuration: Duration(seconds: duration),
      gravity: ToastGravity.TOP,
    );
  }
}
