import 'package:bonfire/bonfire.dart';
import 'package:mini_rpg/src/WorldGame.dart';
import 'package:mini_rpg/src/sprites/mobs/comum_sprites_sheet.dart';
import 'dart:async' as async;

class DevilMob extends SimpleEnemy with BlockMovementCollision, UseLifeBar, RandomMovement {
  final Vector2 initPosition;

  DevilMob({required this.initPosition}) : super (  
    position: initPosition,
    size: Vector2.all(32),
    animation: ComumSpritesSheet(path: "mobs/devil.png", size: 32).simpleAnimations(),
    speed: WorldGame.worldTileSize * 1.3
  );

  ComumSpritesSheet comumSprites = ComumSpritesSheet(path: "mobs/devil.png", size: 32);
  bool _inStun = false;

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(position: Vector2(10, 10), size: Vector2(13, 18)));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (!_inStun) {
      seePlayer(
        observed: (player) {
          seeAndMoveToPlayer(
            closePlayer: (player) => {
              simpleAttackMelee(
                damage: 20, 
                size: size / 2,
                animationRight: comumSprites.simpleAttackRight
              ),
            },
            radiusVision: WorldGame.worldTileSize * 2,
            margin: 5
          );
        },
        notObserved: () {
          runRandomMovement(
            dt,
            maxDistance: 25,
            timeKeepStopped: 5000
          );
        }
      );
    }

    super.update(dt);
  }

  @override
  bool receiveDamage(AttackOriginEnum attacker, double damage, identify) {
    if (attacker != AttackOriginEnum.PLAYER_OR_ALLY) {
      return super.receiveDamage(attacker, damage, identify);
    }

    animation?.playOnce(
      comumSprites.takeHitRight,
      runToTheEnd: true,
      flipX: lastDirectionHorizontal == Direction.left,
    );
    return super.receiveDamage(attacker, damage, identify);
  }

  @override
  void onDie() {
    final ref = gameRef;
    animation?.playOnce(
      flipX: lastDirectionHorizontal == Direction.left,
      comumSprites.deadRight,
      runToTheEnd: true,
      onStart: () => speed = 0,
      onFinish: () => removeFromParent()
    );

    async.Timer(Duration(seconds: 10), () {
      ref.add(DevilMob(initPosition: initPosition));
    });

    super.onDie();
  }
}