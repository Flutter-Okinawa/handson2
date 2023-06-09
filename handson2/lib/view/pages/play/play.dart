import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:handson2/game_info/enum/mino_type.dart';
import 'package:handson2/models/hold_model.dart';
import 'package:handson2/models/nexts_model.dart';
import 'package:handson2/models/operation_model.dart';
import 'package:handson2/models/placed_blocks_model.dart';
import 'package:handson2/view/widgets/buttons/move_button.dart';
import 'package:handson2/view/widgets/buttons/rotate_button.dart';
import 'package:handson2/view/widgets/displayer/disp_blocks.dart';
import 'package:handson2/view/widgets/displayer/disp_holded.dart';
import 'package:handson2/view/widgets/displayer/disp_nexts.dart';

class Play extends StatelessWidget {
  Widget _displays() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HoldedMinoDisplayer(),
          Flexible(child: BlockDisplayer(height: 20, width: 10)),
          NextsDisplayer(),
        ],
      ),
    );
  }

  Widget _buttons() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(child: MoveButton.unit()),
          Expanded(child: RotateButton.unit()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Play")),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<HoldModel>(create: (_) => HoldModel()),
          ChangeNotifierProvider<NextsModel>(create: (_) => NextsModel()),
          ChangeNotifierProvider<PlacedBlocksModel>(
            create: (_) => PlacedBlocksModel(),
          ),
        ],
        child: ChangeNotifierProvider<OperationModel>(
          create: (BuildContext context) {
            final TetroMino firstMino =
                Provider.of<NextsModel>(context, listen: false).nextMino;

            return OperationModel(firstMino);
          },
          child: Container(
            child: Column(
              children: [
                Expanded(child: _displays()),
                _buttons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
