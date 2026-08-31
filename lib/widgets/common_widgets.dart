import 'package:flutter/material.dart';

class B2BWidgets {
  //MARK: Vertical Spacing
  static Widget verticalSpacing(double value, {Widget? child}) {
    return SizedBox(height: value, child: child);
  }

  //MARK: Horizontal Spacing
  static Widget horizontalSpacing(double value, Widget? child) {
    return SizedBox(width: value, child: child);
  }

  //MARK: Standard Padding
  static Widget standardPadding(double value, Widget? child) {
    return Padding(padding: EdgeInsets.all(value), child: child);
  }

  static Widget listTile(
    Color color,
    double radius,
  ) {
    return Container();
  }

  //MARK: Label Widget
  static Widget setLabel(
    String title,
    TextAlign txtAlign,
    TextStyle txtStyle,
  ) {
    return Text(
      title,
      style: txtStyle,
      textAlign: txtAlign,
    );
  }

}