import 'package:bonfire/bonfire.dart';

class DecorationSpriteSheet {
  static Future<Sprite> get chestClosed {
    return Sprite.load(
      "resources/tundra/tundra_ [resources].png",
      srcPosition: Vector2(16, 16 * 5),
      srcSize: Vector2(16, 32)
    );
  }

  static Future<Sprite> get chestOpen {
    return Sprite.load(
      "resources/tundra/tundra_ [resources].png",
      srcPosition: Vector2(32, 16 * 5),
      srcSize: Vector2(16, 32)
    );
  }
}