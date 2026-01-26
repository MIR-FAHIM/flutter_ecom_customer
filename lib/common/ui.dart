import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ecom_delivery_flutter/app/modules/global_widgets/block_button_widget.dart';
import 'package:ecom_delivery_flutter/common/Color.dart';
import 'package:ecom_delivery_flutter/common/custom_data.dart';

class Ui {
  static GetSnackBar SuccessSnackBar(
      {String title = 'Success', required String message}) {
    Get.log("[$title] $message");
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.bodySmall!.merge(TextStyle(color: Colors.white))),
      messageText: Text(message.tr,
          style: Get.textTheme.bodyMedium!.merge(TextStyle(color: Colors.white))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Colors.green,
      icon: Icon(Icons.check_circle_outline, size: 32, color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      dismissDirection: DismissDirection.horizontal,
      duration: Duration(seconds: 2),
    );
  }

  static GetSnackBar ErrorSnackBar(
      {String title = 'Something went wrong!', required String message}) {
    Get.log("[$title] $message", isError: true);
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.bodySmall!.merge(TextStyle(color: Colors.red))),
      messageText: Text(message.tr,
          style: Get.textTheme.bodyMedium!.merge(TextStyle(color: Colors.red))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      borderColor: Colors.red,
      backgroundColor: Colors.white,
      icon: Icon(Icons.remove_circle_outline, size: 32, color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: Duration(seconds: 3),
    );
  }

  static GetSnackBar AuthenticationErrorSnackBar(
      {required String title, required String message}) {
    Get.log("[$title] $message", isError: true);
    return GetSnackBar(
      titleText: Text(title.tr,
          style:
              Get.textTheme.bodyMedium!.merge(TextStyle(color: Get.theme.primaryColor))),
      messageText: Text(message.tr,
          style: Get.textTheme.bodyMedium!.merge(TextStyle(color: Get.theme.primaryColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon: Icon(Icons.remove_circle_outline, size: 32, color: Get.theme.primaryColor),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: Duration(seconds: 5),
    );
  }

  static GetSnackBar defaultSnackBar({String title = 'Alert', required String message}) {
    Get.log("[$title] $message", isError: false);
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.bodyMedium!.merge(TextStyle(color: Get.theme.hintColor))),
      messageText: Text(message,
          style: Get.textTheme.bodyMedium!.merge(TextStyle(color: Get.theme.focusColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Get.theme.primaryColor,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon: Icon(Icons.warning_amber_rounded, size: 32, color: Get.theme.hintColor),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: Duration(seconds: 5),
    );
  }

  static GetSnackBar notificationSnackBar(
      {String title = 'Notification', required String message}) {
    Get.log("[$title] $message", isError: false);
    return GetSnackBar(
      titleText: Text(title.tr, style: TextStyle(color: AppColors.primaryColor)),
      messageText: Text(message, style: TextStyle(color: AppColors.homeTextColor3)),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(20),
      backgroundColor: Colors.white,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon: Icon(Icons.notifications_none, size: 32, color: Get.theme.hintColor),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: Duration(seconds: 5),
    );
  }

  static BoxDecoration getBoxDecoration({
    Color? color,
    double? radius,
    Border? border,
    Gradient? gradient,
  }) {
    return BoxDecoration(
      color: color ?? Get.theme.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
      boxShadow: [
        BoxShadow(
            color: Color(0xFF652981).withOpacity(0.3),
            blurRadius: 2,
            offset: Offset(0, 2)),
      ],
      //  border: border ?? Border.all(color: Get.theme.focusColor.withOpacity(0.05)),
      gradient: gradient,
    );
  }

  static BoxDecoration getBoxDecorationImage(
      {Color? color,
      double? radius,
      Border? border,
      Gradient? gradient,
      String image = ''}) {
    return BoxDecoration(
        //  color: color ?? Get.theme.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        // boxShadow: [
        //   BoxShadow(
        //       color: Get.theme.focusColor.withOpacity(0.1),
        //       blurRadius: 5,
        //       offset: Offset(0, 5)),
        // ],
        border: border ?? Border.all(color: Get.theme.focusColor.withOpacity(0.05)),
        gradient: gradient,
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill

            //CachedNetworkImageProvider(image), fit: BoxFit.fill),
            ));
  }

  static BoxFit getBoxFit(String boxFit) {
    switch (boxFit) {
      case 'cover':
        return BoxFit.cover;
      case 'fill':
        return BoxFit.fill;
      case 'contain':
        return BoxFit.contain;
      case 'fit_height':
        return BoxFit.fitHeight;
      case 'fit_width':
        return BoxFit.fitWidth;
      case 'none':
        return BoxFit.none;
      case 'scale_down':
        return BoxFit.scaleDown;
      default:
        return BoxFit.cover;
    }
  }

  static AlignmentDirectional getAlignmentDirectional(String alignmentDirectional) {
    switch (alignmentDirectional) {
      case 'top_start':
        return AlignmentDirectional.topStart;
      case 'top_center':
        return AlignmentDirectional.topCenter;
      case 'top_end':
        return AlignmentDirectional.topEnd;
      case 'center_start':
        return AlignmentDirectional.centerStart;
      case 'center':
        return AlignmentDirectional.topCenter;
      case 'center_end':
        return AlignmentDirectional.centerEnd;
      case 'bottom_start':
        return AlignmentDirectional.bottomStart;
      case 'bottom_center':
        return AlignmentDirectional.bottomCenter;
      case 'bottom_end':
        return AlignmentDirectional.bottomEnd;
      default:
        return AlignmentDirectional.bottomEnd;
    }
  }

  static CrossAxisAlignment getCrossAxisAlignment(String textPosition) {
    switch (textPosition) {
      case 'top_start':
        return CrossAxisAlignment.start;
      case 'top_center':
        return CrossAxisAlignment.center;
      case 'top_end':
        return CrossAxisAlignment.end;
      case 'center_start':
        return CrossAxisAlignment.center;
      case 'center':
        return CrossAxisAlignment.center;
      case 'center_end':
        return CrossAxisAlignment.center;
      case 'bottom_start':
        return CrossAxisAlignment.start;
      case 'bottom_center':
        return CrossAxisAlignment.center;
      case 'bottom_end':
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.start;
    }
  }

  static InkWell getIconButton(
      {var icon,
      double? height,
      Color? textColor,
      double horrizontal = 0.0,
      double vertical = 0.0,
      double? width,
      double? radius = 0.0,
      Color? color,
      Color? iconColor,
      text,
      VoidCallback? press}) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.only(
            left: horrizontal, right: horrizontal, top: vertical, bottom: vertical),
        height: height,
        width: width,
        decoration: getBoxDecoration(
            color: color,
            radius:
                radius), //BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius!)),
        child: icon != null
            ? Center(
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              )
            : Center(
                child: Text(
                  text,
                  style:
                      TextStyle(color: textColor ?? Get.theme.textTheme.bodyMedium!.color),
                ),
              ),
      ),
    );
  }

  static SizedBox customButton(
      {String? text,
      VoidCallback? press,
      Color? color,
      double width = double.infinity,
      double height = 56,
      double radius = 20,
      double fontSize = 18.0,
      Color textColor = Colors.white}) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          backgroundColor: color,
        ),
        onPressed: press,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );
  }

  static InputDecoration getInputDecoration(
      {String hintText = '',
      String? errorText,
      IconData? iconData,
      Widget? suffixIcon,
      Widget? suffix,
      String? imageData,
      imageColor}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Get.textTheme.bodyMedium,
      prefixIcon: imageData == null
          ? iconData != null
              ? Icon(
                  iconData,
                  color: Color(0xFF652981),
                ).marginOnly(right: 14)
              : Wrap()
          : Image.asset(
              imageData,
              color: Color(0xFF652981),
            ).marginOnly(right: 14),
      prefixIconConstraints: BoxConstraints.expand(width: 38, height: 38),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.all(0),
      focusColor: Color(0xFF652981),
      border: OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      suffixIcon: suffixIcon,
      suffix: suffix,
      errorText: errorText,
    );
  }

  static InputDecoration getInputDecorationWithoutCounter(
      {String hintText = '',
      String? errorText,
      IconData? iconData,
      Widget? suffixIcon,
      Widget? suffix,
      String? imageData,
      String? counterText,
      imageColor}) {
    return InputDecoration(
      counterText: counterText,
      hintText: hintText,
      hintStyle: Get.textTheme.bodyMedium,
      prefixIcon: imageData == null
          ? iconData != null
              ? Icon(
                  iconData,
                  color: Color(0xFF652981),
                ).marginOnly(right: 14)
              : Wrap()
          : Image.asset(
              imageData,
              color: Color(0xFF652981),
            ).marginOnly(right: 14),
      prefixIconConstraints: BoxConstraints.expand(width: 38, height: 38),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.all(0),
      focusColor: Color(0xFF652981),
      border: OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      suffixIcon: suffixIcon,
      suffix: suffix,
      errorText: errorText,
    );
  }

  static InputDecoration getInputDecorationWithIcon(
      {String hintText = '',
      String? errorText,
      IconData? iconData,
      Widget? suffixIcon,
      Widget? suffix,
      imageColor}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Get.textTheme.bodyMedium,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.all(0),
      focusColor: Color(0xFF652981),
      border: OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      suffixIcon: suffixIcon,
      suffix: suffix,
      errorText: errorText,
    );
  }

  static Widget customSuffixIcon({svgIcon}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        20,
        20,
        20,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: 18,
      ),
    );
  }

  static Widget shimmerLoader(
      {double? width = 200,
      double? height = 100,
      Color? baseColor,
      Color? highlightColor}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade50,
      highlightColor: Colors.grey.shade200,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: Get.size.width * .3,
          width: Get.size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  static Widget customLoader() {
    return SpinKitWave(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Color(0xFF652981),
          ),
        );
      },
    );
  }

  static customLoaderSplash() {
    return SpinKitThreeBounce(
      size: 25,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
        );
      },
    );
  }

  static customLoaderDialog() {
    return Get.dialog(SpinKitWave(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Color(0xFF652981),
          ),
        );
      },
    ));
  }

  static customLoaderDialogWithMessage() {
    return Get.defaultDialog(
        title: '',
        radius: 8,
        content: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            width: Get.size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SpinKitThreeBounce(
                  size: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50), color: Colors.white),
                    );
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Please Wait'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  static customLoaderDialogWithMEssage() {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40),
      child: Container(
        height: 120,
        width: Get.size.width,
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            SpinKitThreeBounce(
              size: 30,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: index.isEven ? Colors.blue.shade500 : Colors.deepOrange,
                  ),
                );
              },
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Please Wait'.tr,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }

  static Future<T?> showWithdrawDialog<T>(
      String bkashAmount,
      String nagadAmount,
      String rocketAmount, {
        VoidCallback? onBkashTap,
        VoidCallback? onNagadTap,
        VoidCallback? onRocketTap,
      }) {
    final context = Get.context;
    if (context == null) return Future.value(null);

    return showDialog<T>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        final theme = Theme.of(ctx);
        final primary = theme.colorScheme.primary;

        Widget operatorCard({
          required String title,
          required String amount,
          required IconData icon,
          VoidCallback? onTap,
        }) {
          return InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: primary.withOpacity(0.25), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: primary.withOpacity(0.12),
                      child: Icon(icon, color: primary, size: 18),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            amount,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.textTheme.bodySmall?.color,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          );
        }

        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Container(
            width: MediaQuery.of(ctx).size.width * 0.92,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: primary.withOpacity(0.25), width: 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Withdraw Amount by operator",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Cards
                operatorCard(
                  title: "Bkash",
                  amount: bkashAmount,
                  icon: Icons.account_balance_wallet_outlined,
                  onTap: () {
                    Navigator.of(ctx).pop();
                    onBkashTap?.call();
                  },
                ),
                operatorCard(
                  title: "Nagad",
                  amount: nagadAmount,
                  icon: Icons.payments_outlined,
                  onTap: () {
                    Navigator.of(ctx).pop();
                    onNagadTap?.call();
                  },
                ),
                operatorCard(
                  title: "Rocket",
                  amount: rocketAmount,
                  icon: Icons.rocket_launch_outlined,
                  onTap: () {
                    Navigator.of(ctx).pop();
                    onRocketTap?.call();
                  },
                ),

                const SizedBox(height: 10),

                // Bottom action
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow.shade600,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text("Close"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Generic confirm/info dialog (NO AwesomeDialog)
  static Future<T?> showAwesomeDialog<T>(
      String title,
      String description,
      Color? color,
      VoidCallback? onTap, {
        bool showClose = false,
        bool isBarrierDismiss = true,
        String type = 'info',
        String okay = 'Yes, Proceed',
      }) {
    final context = Get.context;
    if (context == null) return Future.value(null);

    return showDialog<T>(
      context: context,
      barrierDismissible: isBarrierDismiss,
      builder: (ctx) {
        final theme = Theme.of(ctx);
        final primary = theme.colorScheme.primary;
        final okColor = color ?? Colors.yellow.shade600;

        IconData typeIcon() {
          switch (type) {
            case 'success':
              return Icons.verified_rounded;
            case 'warning':
              return Icons.warning_amber_rounded;
            case 'error':
              return Icons.error_outline_rounded;
            case 'info':
            default:
              return Icons.info_outline_rounded;
          }
        }

        Color typeTint() {
          switch (type) {
            case 'success':
              return Colors.green;
            case 'warning':
              return Colors.orange;
            case 'error':
              return Colors.red;
            case 'info':
            default:
              return primary;
          }
        }

        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Container(
            width: MediaQuery.of(ctx).size.width * 0.92,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: primary.withOpacity(0.25), width: 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: typeTint().withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: typeTint().withOpacity(0.25), width: 1),
                      ),
                      child: Icon(typeIcon(), color: typeTint()),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            description,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (showClose)
                      IconButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        icon: const Icon(Icons.close),
                      ),
                  ],
                ),

                const SizedBox(height: 16),

                // Primary action
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: okColor,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      onTap?.call();
                    },
                    child: Text(okay, style: const TextStyle(fontWeight: FontWeight.w800)),
                  ),
                ),

                const SizedBox(height: 10),

                // Optional close
                if (showClose)
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: BorderSide(color: Colors.red.withOpacity(0.55)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: const Text('No, Close', style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget offsetPopup() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text(
              "Flutter Open",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Text(
              "Flutter Tutorial",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
        ],
        icon: Icon(Icons.arrow_drop_down),
        offset: Offset(50, 50),
      );




}
