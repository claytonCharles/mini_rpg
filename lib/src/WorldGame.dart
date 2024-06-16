import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:mini_rpg/src/interfaces/components/life_bar_component.dart';
import 'package:mini_rpg/src/maps/initial_map.dart';

class WorldGame extends StatefulWidget {
  const WorldGame({super.key, required this.character});
  final Player character;
  static double worldTileSize = 16;

  @override
  State<WorldGame> createState() => _WorldGameState();
}

class _WorldGameState extends State<WorldGame> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BonfireWidget(
        player: widget.character,
        playerControllers: [
          Joystick(
            directional: JoystickDirectional(),
            actions: [
              JoystickAction(
                actionId: 1,
              )
            ]
          )
        ],
        map: InitialMap().initWorld(),
        cameraConfig: CameraConfig(
          zoom: getZoomFromMaxVisibleTile(context, WorldGame.worldTileSize, 20),
          initPosition: Vector2(WorldGame.worldTileSize * 5, WorldGame.worldTileSize * 5),
          moveOnlyMapArea: true,
        ),
        showCollisionArea: true,
        hudComponents: [
          LifeBarComponent()
        ],
      ),
    );
  }
}