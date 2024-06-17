import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BagComponent extends InterfaceComponent {
  BagComponent() : super(
    id: 2,
    position: Vector2(750, 50),
    size: Vector2.all(32),
    spriteUnselected: Sprite.load("ui/interact_button.png")
  );

  final teste = Flame.images.load("ui/interact_button.png");
  static List fantasyInv = [];

  @override
  Future<void> onLoad() {
    return super.onLoad();
  }

  @override
  void update(double dt) async {
    
    super.update(dt);
  }

  @override
  void onTap() async {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            child: GridView.count(
              shrinkWrap: true,
                crossAxisCount: 5,
                children: List.generate(fantasyInv.length, (index) {
                  final item = fantasyInv[index];
                  print(item.name);
                  return SpriteButton(
                    sprite: item.icon,
                    label: Text(""),
                    pressedSprite: item.icon,
                    height: 30,
                    width: 30,
                    onPressed: () {
                      item.onUse(gameRef);
                    },
                  );
                }),
              ),
          ),
        );
      }
    );
    super.onTap();
  }
}