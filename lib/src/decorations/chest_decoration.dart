import 'package:bonfire/bonfire.dart';
import 'package:mini_rpg/src/sprites/decorations/decoration_sprite_sheet.dart';

class ChestDecoration extends GameDecoration with Vision, TapGesture {
  ChestDecoration(Vector2 position) : super.withSprite(
    position: position,
    size: Vector2(16, 32),
    sprite: DecorationSpriteSheet.chestClosed,
  );

  bool onRange = false;

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(position: Vector2(2, 15), size: Vector2.all(14)));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    seeComponent(
      gameRef.player!, 
      observed: (player) {
        if (!onRange) {
          onRange = true;          
        }
      },
      notObserved: () {
        onRange = false;
      },
      radiusVision: 16
    );

    super.update(dt);
  }
  
  @override
  void onTap() {
    if (onRange) {
      print("IIIIRUUU");
    }
  }

  @override
  void onTapCancel() {
    super.onTapCancel();
  }
}