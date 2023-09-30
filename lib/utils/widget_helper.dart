import 'package:flutter/widgets.dart';

extension AddMargin on Widget {
  Widget addMarginBottom(double? margin) {
    return Container(
      margin: EdgeInsets.only(bottom: margin ?? 0),
      child: this,
    );
  }

  Widget addMarginTop(double? margin) {
    return Container(
      margin: EdgeInsets.only(top: margin ?? 0),
      child: this,
    );
  }

  Widget addMarginLeft(double? margin) {
    return Container(
      margin: EdgeInsets.only(left: margin ?? 0),
      child: this,
    );
  }

  Widget addMarginRight(double? margin) {
    return Container(
      margin: EdgeInsets.only(left: margin ?? 0),
      child: this,
    );
  }

  Widget addAllMargin(double? margin) {
    return Container(
      margin: EdgeInsets.all(margin ?? 0),
      child: this,
    );
  }

  Widget addSymmetricMargin({double? vertical, double? horizontal}) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: vertical ?? 0,
        horizontal: horizontal ?? 0,
      ),
      child: this,
    );
  }

  Widget addMarginOnly({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: left ?? 0,
        top: top ?? 0,
        right: right ?? 0,
        bottom: bottom ?? 0,
      ),
      child: this,
    );
  }

  get addExpanded {
    return Expanded(child: this);
  }
}

class WidgetHelper {}
