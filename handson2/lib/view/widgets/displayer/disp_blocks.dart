import 'package:handson2/game_info/common/cordinate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:handson2/game_info/render/block.dart';
import 'package:handson2/models/operation_model.dart';
import 'package:handson2/models/placed_blocks_model.dart';
import 'package:handson2/view/widgets/tetromino/tetris_block.dart';

class BlockDisplayer extends StatelessWidget {
  final int height;
  final int width;

  static const double gridSize = 30.0;

  BlockDisplayer({
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, PlacedBlocksModel placedBlocksModel, _) {
        return Consumer(
          builder: (BuildContext context, OperationModel operationModel, __) {
            final List<Block> operationBlocks =
                operationModel.operationMino.blocks;

            final List<Block> filledField =
                placedBlocksModel.fillBlank(operationBlocks, height, width);

            return AspectRatio(
              aspectRatio: 0.5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  semanticChildCount: height * width,
                  childAspectRatio: 1,
                  crossAxisCount: 10,
                  children: filledField
                      .map((b) => Container(
                            height: gridSize,
                            width: gridSize,
                            decoration: BoxDecoration(
                              color: b.color,
                              border: Border.all(color: Colors.white),
                            ),
                          ))
                      .toList(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
