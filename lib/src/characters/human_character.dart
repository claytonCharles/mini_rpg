import 'package:bonfire/bonfire.dart';
import 'package:mini_rpg/src/WorldGame.dart';
import 'package:mini_rpg/src/sprites/characters/human_sprites_sheet.dart';

class HumanCharacter extends SimplePlayer with BlockMovementCollision {
  HumanCharacter(Vector2 position) : super(
    position: position,
    size: Vector2.all(32),
    life: 1000,
    speed: WorldGame.worldTileSize * 1.3,
    animation: HumanSpritesSheet().simpleAnimations()
  );

  HumanSpritesSheet humanSprites = HumanSpritesSheet();
  bool _inAttack = false;

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(position: Vector2(10, 11), size: Vector2(12, 17)));
    return super.onLoad();
  }


  @override
  void onJoystickAction(JoystickActionEvent event) {
    if (event.id == 1 && event.event == ActionEvent.DOWN && !_inAttack) {
      simpleAttackMelee(
        damage: 100, 
        size: Vector2.all(16),
        withPush: false,
        animationRight: humanSprites.simpleAttackRight
      );
    }

    super.onJoystickAction(event);
  }
}