import 'package:bonfire/bonfire.dart';
import 'package:mini_rpg/src/interfaces/components/bag_component.dart';
import 'dart:async' as async;

import 'package:mini_rpg/src/itens/mushroom_item.dart';

class MushroomDecoration extends GameDecoration with TapGesture {
  final Vector2 initPosition;
  MushroomDecoration({required this.initPosition}) : super.withSprite(
    position: initPosition,
    size: Vector2.all(16),
    sprite: Sprite.load(
      "resources/tundra/tundra_ [resources].png",
      srcPosition: Vector2(16 * 7, 16),
      srcSize: Vector2(16, 16)
    )
  );

  @override
  void onTap() async {
    final icon = await Sprite.load(
      "resources/tundra/tundra_ [resources].png",
      srcPosition: Vector2(16 * 7, 16),
      srcSize: Vector2(16, 16)
    );
    BagComponent.fantasyInv.add(MushroomItem(icon: icon));
    removeFromParent();
  }

  @override
  void onRemove() {
    final ref = gameRef;
    async.Timer(Duration(seconds: 10), () {
      ref.add(MushroomDecoration(initPosition: initPosition));
    });
    super.onRemove();
  }
}