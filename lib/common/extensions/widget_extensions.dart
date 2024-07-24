import 'package:flutter/material.dart';

extension CustomWidget on Widget {
  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget expanded(int? flex) {
    return Expanded(
      flex: flex ?? 1,
      child: this,
    );
  }

  Widget makeSafeArea() {
    return SafeArea(child: this);
  }

  Widget onTap(void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      // splashFactory: NoSplash.splashFactory,
      // splashColor: Colors.transparent,
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }

  Widget onLongPress(void Function()? onPress) {
    return GestureDetector(
      onLongPress: onPress,
      behavior: HitTestBehavior.opaque,
      // highlightColor: Colors.red,
      // highlightShape: BoxShape.rectangle,
      // splashFactory: NoSplash.splashFactory,
      child: Container(child: this),
    );
  }
}
