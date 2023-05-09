import 'dart:async';

import 'package:handson2/game_info/enum/mino_type.dart';
import 'package:flutter/widgets.dart';

class HoldModel extends ChangeNotifier {
  late TetroMino holdedMino;

  void hold(TetroMino mino) {
    holdedMino = mino;
    notifyListeners();
  }
}
