import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one/data/client.dart';
import 'package:one/data/game_state/game_state.dart';
import 'package:one/screens/game/one_card_widget.dart';
import 'package:one/screens/game/player_info.dart';
import 'package:one/styles.dart';

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
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (gameState.lastPlayed != null)
                Expanded(
                  child: OneCardWidget(
                    card: gameState.lastPlayed!,
                    onTap:
                        () =>
                            ref
                                .read(clientProvider(serverIP).notifier)
                                .takeCard(),
                  ),
                )
              else
                Expanded(child: SizedBox.shrink()),
              Expanded(
                child: GestureDetector(
                  onTap:
                      () =>
                          ref
                              .read(clientProvider(serverIP).notifier)
                              .drawCard(),
                  child: Card(
                    color: Colors.blueGrey,
                    child: Center(child: Text("Draw", style: cardTextStyle)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
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
        Expanded(
          flex: 2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: gameState.myHand.length,
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
