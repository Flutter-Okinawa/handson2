import 'package:handson2/game_info/enum/mino_type.dart';
import 'package:flutter/widgets.dart';

class NextsModel extends ChangeNotifier {
  late List<TetroMino> nexts = List.from(TetroMino.values)..shuffle();
  late TetroMino nextMino;

  NextsModel() {
    nextMino = nexts[0];
    nexts.removeAt(0);
  }

  void _supplyNexts() {
    if (nexts.length >= 6) return;

    nexts.addAll(List.from(TetroMino.values)..shuffle());
  }

  void pushOneOut() {
    nexts.removeAt(0);
    _supplyNexts();

    nextMino = nexts[0];

    notifyListeners();
  }
}
