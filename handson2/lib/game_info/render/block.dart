import 'package:flutter/material.dart';

import 'package:handson2/game_info/common/cordinate.dart';

class Block {
  final Color color;
  Cordinate cordinate;

  Block({
    required this.cordinate,
    required this.color,
  });
}
