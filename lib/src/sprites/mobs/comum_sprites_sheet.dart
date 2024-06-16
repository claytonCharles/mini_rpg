import 'package:bonfire/bonfire.dart';

class ComumSpritesSheet {
  ComumSpritesSheet({required this.path, required this.size});
  String path;
  double size;

  SimpleDirectionAnimation simpleAnimations() {
    return SimpleDirectionAnimation(
      idleRight: idleRight, 
      runRight: runRight,
      others: {
        "dead": idleDeadRight
      }
    );
  }

  Future<SpriteAnimation> get idleRight {
    return SpriteAnimation.load(
      path, 
      SpriteAnimationData.sequenced(
        amount: 4, 
        stepTime: 0.1, 
        textureSize: Vector2.all(size),
        texturePosition: Vector2(0, size)
      )
    );
  }

  Future<SpriteAnimation> get runRight {
    return SpriteAnimation.load(
      path, 
      SpriteAnimationData.sequenced(
        amount: 8, 
        stepTime: 0.1, 
        textureSize: Vector2.all(size),
        texturePosition: Vector2(0, size * 2)
      )
    );
  }

  Future<SpriteAnimation> get takeHitRight {
    return SpriteAnimation.load(
      path, 
      SpriteAnimationData.sequenced(
        amount: 4, 
        stepTime: 0.1, 
        textureSize: Vector2.all(size),
        texturePosition: Vector2(0, size * 7)
      )
    );
  }

  Future<SpriteAnimation> get deadRight {
    return SpriteAnimation.load(
      path, 
      SpriteAnimationData.sequenced(
        amount: 4, 
        stepTime: 0.5, 
        textureSize: Vector2.all(size),
        texturePosition: Vector2(0, size * 8)
      )
    );
  }

    Future<SpriteAnimation> get idleDeadRight {
    return SpriteAnimation.load(
      path, 
      SpriteAnimationData.sequenced(
        amount: 1, 
        stepTime: 0.1, 
        textureSize: Vector2.all(size),
        texturePosition: Vector2(size * 3, size * 8)
      )
    );
  }
}