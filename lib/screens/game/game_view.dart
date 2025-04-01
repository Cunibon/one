import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one/data/client.dart';
import 'package:one/data/game_state/game_state.dart';
import 'package:one/screens/game/one_card_widget.dart';
import 'package:one/screens/game/player_info.dart';

class GameView extends ConsumerWidget {
  const GameView({required this.gameState, super.key});

  final GameState gameState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerInfos = gameState.playerCards.entries.toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 350),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OneCardWidget(
                    card: gameState.lastPlayed,
                    onTap: () => ref.read(clientProvider.notifier).takeCard(),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => ref.read(clientProvider.notifier).drawCard(),
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
        ),
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 200),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
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
        ),
        Flexible(
          flex: 2,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 350),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: gameState.myHand.length,
              itemBuilder:
                  (context, index) => OneCardWidget(
                    card: gameState.myHand[index],
                    onTap:
                        () => ref
                            .read(clientProvider.notifier)
                            .playCard(gameState.myHand[index]),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
