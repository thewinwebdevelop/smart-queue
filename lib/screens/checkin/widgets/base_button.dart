import 'package:flutter/material.dart';
import 'package:smart_queue/configs/color.dart';

Widget baseButton(VoidCallback onClick, String text) => ElevatedButton(
  onPressed: onClick,
  style: ButtonStyle(
    elevation: WidgetStateProperty.all(0),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      return ColorsConfig.primaryColor;
    }),
    backgroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      return ColorsConfig.primaryColor;
    }),
    minimumSize: WidgetStateProperty.all<Size>(Size.zero),
    padding: WidgetStateProperty.all(EdgeInsets.zero),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    ),
  ),
  child: Text(text, style: TextStyle(color: ColorsConfig.softTextColor)),
);
