import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one/data/client.dart';
import 'package:one/data/game_state/game_state.dart';
import 'package:one/screens/game/one_card_widget.dart';
import 'package:one/screens/game/player_info.dart';

class GameView extends ConsumerWidget {
  const GameView({required this.serverIP, required this.gameState, super.key});

  final String serverIP;
  final GameState gameState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerInfos = gameState.playerCards.entries.toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 350),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: OneCardWidget(
                  card: gameState.lastPlayed,
                  onTap:
                      () =>
                          ref
                              .read(clientProvider(serverIP).notifier)
                              .takeCard(),
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: GestureDetector(
                  onTap:
                      () =>
                          ref
                              .read(clientProvider(serverIP).notifier)
                              .drawCard(),
                  child: Card(
                    color: Colors.blueGrey,
                    child: Center(
                      child: Icon(Icons.add, color: Colors.black, size: 100),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: playerInfos.length,
              itemBuilder:
                  (context, index) => PlayerInfo(
                    name: playerInfos[index].key,
                    cardCount: playerInfos[index].value,
                  ),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: gameState.myHand.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder:
                (context, index) => OneCardWidget(
                  card: gameState.myHand[index],
                  onTap:
                      () => ref
                          .read(clientProvider(serverIP).notifier)
                          .playCard(gameState.myHand[index]),
                ),
          ),
        ),
      ],
    );
  }
}
