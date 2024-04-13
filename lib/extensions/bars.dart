import 'package:car_rental/common_libs.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

extension DeviceBar on BuildContext {
  Future<T?> showBottomBar<T>({
    required Widget child,
    double? height,
    bool dismissable = true,
    bool ignoreHeight = true,
  }) {
    final defaultHeight = screenHeight - (top + kToolbarHeight * 2);

    final result = showModalBottomSheet<T>(
      context: this,
      isScrollControlled: true,
      isDismissible: dismissable,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(maxHeight: height ?? defaultHeight),
      builder: (_) => Material(
        color: Colors.transparent,
        child: Container(
          height: ignoreHeight ? null : height,
          color: backgroundColor,
          child: child.fadeInAndMoveFromBottom(),
        ),
      ),
    );
    return result;
  }

  Future<T?> showAlertDialog<T>(
      {IconData? icon,
      required String title,
      String? desctiption,
      List<Widget> actions = const []}) {
    return showCustomAlertDIalog(
      icon: Icon(
        icon ?? Icons.info_rounded,
        color: $isDarkMode ? shadeWhite : neutral800,
        size: 70,
      ),
      title: title,
      description: desctiption,
      children: [
        verticalSpaceMedium,
        ...actions,
      ],
    );
  }

  showInformationSnackBar(String desciption) {
    showTopSnackBar(
        Overlay.of(this),
        CustomSnackBar.info(
            message: desciption,
            backgroundColor: secondary500,
            iconRotationAngle: 0,
            iconPositionTop: -10,
            iconPositionLeft: -10,
            icon: Icon(Icons.info_outline_rounded,
                color: neutral900.withOpacity(.15), size: 120),
            messagePadding: const EdgeInsets.all(space16),
            textAlign: TextAlign.start,
            textStyle: satoshi500S14.copyWith(
                color: shadeWhite, fontWeight: FontWeight.w600)),
        snackBarPosition: SnackBarPosition.top);
  }

  Future<T?> $showGeneralDialog<T>({
    required Widget child,
    required String barrierLabel,
    bool dismissible = true,
  }) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: dismissible,
      barrierLabel: barrierLabel,
      barrierColor: neutral800.withOpacity(0.5),
      transitionDuration: fastDuration,
      pageBuilder: (_, __, ___) => Dialog(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(cornersSmall),
          ),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: child.fadeInAndMoveFromBottom(),
        ),
      ),
      transitionBuilder: (_, anim, __, child) => FadeTransition(
        opacity: Tween(begin: 0.0, end: 1.0).animate(anim),
        child: child,
      ),
    );
  }

  void showErrorSnackBar(String? cause) {
    showTopSnackBar(
        Overlay.of(this),
        CustomSnackBar.error(
            message: cause ?? 'An error occurred',
            backgroundColor: destructive500,
            messagePadding: const EdgeInsets.all(space16),
            textAlign: TextAlign.start,
            textStyle: satoshi500S14.copyWith(
                color: shadeWhite, fontWeight: FontWeight.w600)),
        snackBarPosition: SnackBarPosition.top);
  }

  Future<Y?> showErrorDialog<Y>(
    String? cause, {
    String? title,
    Icon? icon,
    List<Widget> children = const [],
  }) {
    return showBottomBar(
      child: InformationWidget(
        icon: icon ??
            const Icon(
              Icons.error_rounded,
              color: Colors.red,
              size: 70,
            ),
        title: title ?? 'Error Occurred',
        description: cause ?? 'An error occurred, please try again later.',
        children: children,
      ),
    );
  }

  void showSuccessSnackBar(String message) {
    showTopSnackBar(
        Overlay.of(this),
        CustomSnackBar.success(
            message: message,
            backgroundColor: primary400,
            messagePadding: const EdgeInsets.all(space16),
            textAlign: TextAlign.start,
            textStyle: satoshi500S14.copyWith(
                color: shadeWhite, fontWeight: FontWeight.w600)),
        snackBarPosition: SnackBarPosition.top);
  }

  Future<S?> showSuccessDialog<S>(
    String description, {
    String? title,
    Icon? icon,
    List<Widget> children = const [],
  }) {
    return showBottomBar<S>(
      child: InformationWidget(
        icon: icon ??
            const Icon(
              Icons.check_rounded,
              color: Colors.green,
              size: 70,
            ),
        title: title ?? 'Successful',
        description: description,
        children: children,
      ),
    );
  }

  Future<S?> showCustomAlertDIalog<S>({
    String? description,
    String? title,
    Icon? icon,
    List<Widget> children = const [],
  }) {
    return showBottomBar<S>(
      child: InformationWidget(
        icon: icon,
        title: title,
        description: description,
        children: children,
      ),
    );
  }
}
