import 'package:bonfire/bonfire.dart';

class HumanSpritesSheet {
  final String path = "characters/mPlayer_ human.png";
  final double size = 32;

  SimpleDirectionAnimation simpleAnimations() {
    return SimpleDirectionAnimation(
      idleRight: idleRight, 
      runRight: runRight
    );
  }

  Future<SpriteAnimation> get idleRight {
    return SpriteAnimation.load(
      path, 
      SpriteAnimationData.sequenced(
        amount: 4, 
        stepTime: 0.1,
        textureSize: Vector2.all(size),
        texturePosition: Vector2(0, size),
      )
    );
  }

  Future<SpriteAnimation> get runRight {
    return SpriteAnimation.load(
      path, 
      SpriteAnimationData.sequenced(
        amount: 8, 
        stepTime: 0.2, 
        textureSize: Vector2.all(size),
        texturePosition: Vector2(0, size * 2)
      )
    );
  }

  Future<SpriteAnimation> get takeHitRight {
    return SpriteAnimation.load(
      path, 
      SpriteAnimationData.sequenced(
        amount: 8, 
        stepTime: 0.2, 
        textureSize: Vector2.all(size),
        texturePosition: Vector2(0, size * 2)
      )
    );
  }

  Future<SpriteAnimation> get simpleAttackRight {
    return SpriteAnimation.load(
      "characters/simpleEffect.png",
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.2, 
        textureSize: Vector2.all(16),
        texturePosition: Vector2(0, 0)
      )
    );
  }
}