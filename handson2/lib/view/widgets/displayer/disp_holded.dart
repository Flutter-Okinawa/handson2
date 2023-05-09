import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:handson2/game_info/enum/mino_type.dart';
import 'package:handson2/models/hold_model.dart';
import 'package:handson2/view/widgets/displayer/tetromino_displayer.dart';

class HoldedMinoDisplayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TetroMino holdedMino = Provider.of<HoldModel>(context).holdedMino;

    return Container(
      child: TetroMinoDisplayer(
        minoType: holdedMino,
        gridSize: 18,
        scale: 1,
      ),
    );
  }
}
