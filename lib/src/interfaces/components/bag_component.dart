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

  static List fantasyInv = [];
  bool teste = false;

  @override
  Future<void> onLoad() {
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (teste) {
      onTap();
      teste = false;
    }
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
                  return SpriteButton(
                    sprite: item.icon,
                    label: Text(
                      "${item.quantity}",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                    pressedSprite: item.icon,
                    height: 10,
                    width: 10,
                    onPressed: () {
                      item.onUse(gameRef);
                      if (item.quantity == 1) {
                        fantasyInv.removeWhere((oldItem) => oldItem.name == item.name);
                        teste = true;
                        Navigator.pop(
                          context
                        );
                        return;
                      }

                      item.quantity -= 1;
                      teste = true;
                      Navigator.pop(
                        context
                      );
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

  static void addItemInventory(newItem) {
    for (final item in fantasyInv) {
      if (item.name == newItem.name) {
        item.quantity += 1;
        return;
      }
    }

    fantasyInv.add(newItem);
  }
}