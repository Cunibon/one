import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one/application_constants.dart';
import 'package:one/data/client.dart';
import 'package:one/data/one_card/one_card.dart';
import 'package:one/data/one_card/one_card_enums.dart';
import 'package:one/data/player_name.dart';
import 'package:one/screens/game/confirmation_dialog.dart';
import 'package:one/screens/game/one_card_widget.dart';
import 'package:one/screens/game/select_color_dialog.dart';

class PlayHandWidget extends ConsumerWidget {
  const PlayHandWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(clientProvider).value!;

    final width = MediaQuery.sizeOf(context).width;
    final rowCount = (width / 130).floor();

    return GridView.builder(
      itemCount: gameState.myHand.length + 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: rowCount,
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
                        builder:
                            (context) =>
                                ConfirmationDialog(title: "Skip your turn?"),
                      );

                      if (result == true) {
                        ref.read(clientProvider.notifier).skipTurn();
                      }
                    }
                    : null,
          );
        }
      },
    );
  }
}
