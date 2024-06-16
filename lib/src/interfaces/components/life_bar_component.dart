import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LifeBarComponent extends InterfaceComponent {
  double maxLife = 0;
  double life = 0;
  double widthLifeBar = 92;

  LifeBarComponent() : super(
    id: 1,
    position: Vector2(20, 10),
    spriteUnselected: Sprite.load('ui/health_bar.png'),
    size: Vector2(120, 50)
  );

  @override
  void update(double dt) {
    super.update(dt);

    if (gameRef.player == null) {
      return;
    }

    maxLife = gameRef.player!.maxLife;
    life = gameRef.player!.life;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    drawLife(canvas);
  }

  drawLife(Canvas canvas) {
    double xBar = 12;
    double yBar = 25;
    double stroke = 5;
    double currentLife = (life * widthLifeBar) / maxLife;

    canvas.drawLine(
      Offset(xBar, yBar), 
      Offset(xBar + widthLifeBar, yBar), 
      Paint()
        ..color = const Color.fromARGB(255, 0, 0, 0)
        ..strokeWidth = stroke
        ..style = PaintingStyle.fill
    );

    canvas.drawLine(
      Offset(xBar, yBar), 
      Offset(xBar + currentLife, yBar), 
      Paint()
        ..color = Colors.green
        ..strokeWidth = stroke
        ..style = PaintingStyle.fill
    );
  }

}