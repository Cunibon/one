import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one/application_constants.dart';
import 'package:one/data/client.dart';
import 'package:one/data/game_state/game_state.dart';
import 'package:one/data/one_card/one_card.dart';
import 'package:one/data/one_card/one_card_enums.dart';
import 'package:one/data/player_name.dart';
import 'package:one/screens/game/one_card_widget.dart';
import 'package:one/screens/game/player_info.dart';
import 'package:one/screens/game/select_color_dialog.dart';
import 'package:one/screens/game/skip_turn_dialog.dart';

class GameView extends ConsumerWidget {
  const GameView({required this.gameState, super.key});

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
                width: 150,
                height: 200,
                child: OneCardWidget(
                  card: gameState.lastPlayed,
                  onTap: () => ref.read(clientProvider.notifier).takeCard(),
                ),
              ),
              IconButton(
                onPressed:
                    gameState.lastPlayed.is0
                        ? () => ref.read(clientProvider.notifier).switchHands()
                        : null,
                icon: Transform.flip(
                  flipX: gameState.clockwise,
                  child: Icon(Icons.arrow_back),
                ),
              ),
              SizedBox(
                width: 150,
                height: 200,
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 100),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: playerInfos.length,
              itemBuilder:
                  (context, index) => PlayerInfo(
                    name: playerInfos[index].key,
                    cardCount: playerInfos[index].value,
                    isActive: gameState.currentPlayer == playerInfos[index].key,
                  ),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: gameState.myHand.length + 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              if (index < gameState.myHand.length) {
                return OneCardWidget(
                  card: gameState.myHand[index],
                  onTap: () async {
                    OneCard card = gameState.myHand[index];

                    if (card.isColorSelect) {
                      final color = await showDialog<CardColor>(
                        context: context,
                        builder: (context) => SelectColorDialog(),
                      );
                      if (color == null) return;

                      card = card.copyWith(color: color);
                    }

                    ref.read(clientProvider.notifier).playCard(card);
                  },
                );
              } else {
                return OneCardWidget(
                  card: OneCard(
                    id: "skip",
                    value: skipTurnCardType,
                    color: CardColor.blank,
                  ),
                  onTap:
                      gameState.currentPlayer == ref.watch(playerNameProvider)
                          ? () async {
                            final result = await showDialog(
                              context: context,
                              builder: (context) => SkipTurnDialog(),
                            );

                            if (result == true) {
                              ref.read(clientProvider.notifier).skipTurn();
                            }
                          }
                          : null,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
