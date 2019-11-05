import 'dart:ui';

import 'package:flutter/material.dart';

class PriorityColor {
  
  static Color priority(String priority) {
    switch (priority?.toLowerCase()) {
      case ("baixa"):
        return Colors.green;
        break;
      case ("média-baixa"):
        return Colors.green[300];
        break;
      case ("média"):
        return Colors.yellow;
        break;
      case ("média-alta"):
        return Colors.orange[800];
        break;
      case ("alta"):
        return Colors.red;
        break;
      default:
        return Colors.white;
        break;
    }
  }
}
