import 'package:flutter/material.dart';

Alignment getFieldAlign(int index) {
  switch (index) {
    case 1:
      return Alignment.topLeft;
    case 2:
      return Alignment.topRight;
    case 3:
      return Alignment.bottomLeft;
    case 4:
      return Alignment.bottomRight;
    default:
      return Alignment.bottomRight;
  }
}
