import 'package:handson2/game_info/enum/move_direction.dart';
import 'package:handson2/models/nexts_model.dart';
import 'package:handson2/models/operation_model.dart';
import 'package:handson2/models/placed_blocks_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoveButton extends StatelessWidget {
  final MoveDirection moveDirection;

  MoveButton({required this.moveDirection});

  static Widget unit() {
    return Container(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 1.0,
            height: 50,
            width: 95,
            child: MoveButton(moveDirection: MoveDirection.Left),
          ),
          Positioned(
            top: 1.0,
            height: 95,
            child: MoveButton(moveDirection: MoveDirection.Up),
          ),
          Positioned(
            right: 1.0,
            height: 50,
            width: 95,
            child: MoveButton(moveDirection: MoveDirection.Right),
          ),
          Positioned(
            bottom: 1.0,
            height: 95,
            child: MoveButton(moveDirection: MoveDirection.Down),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, OperationModel operationModel, _) {
        return RotatedBox(
          quarterTurns: moveDirection.index,
          child: Container(
            height: 50,
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  // side: BorderSide(width: 2.0, color: Colors.grey[400]),
                ),
                // color: Colors.white,
              ),
              onPressed: () {
                operationModel.move(moveDirection);

                if (moveDirection == MoveDirection.Up) {
                  final NextsModel nextsModel = context.read<NextsModel>();
                  final PlacedBlocksModel blocksModel =
                      context.read<PlacedBlocksModel>();

                  operationModel.put(nextsModel.nextMino, (blocks) {
                    blocksModel.addPlacedBlocks(blocks);
                    nextsModel.pushOneOut();
                  });
                }
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.chevron_left),
              ),
            ),
          ),
        );
      },
    );
  }
}
