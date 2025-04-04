import 'package:one/application_constants.dart';
import 'package:one/data/game_logik/game_logik.dart';
import 'package:one/data/one_card/one_card.dart';
import 'package:one/data/one_card/one_card_enums.dart';

extension DefaultGameLogik on GameLogik {
  void drawCard(String playerName) {
    final player = players[playerName];
    final lastCard = deck.removeLast();
    updatePlayer(
      player!.copyWith(hand: Map.from(player.hand)..[lastCard.id] = lastCard),
    );
    reshuffelDeck();
  }

  void takeCard(String playerName) {
    final player = players[playerName];

    if (usedCards.length > 1) {
      final lastCard = usedCards.last;
      if (lastCard.player == playerName) {
        OneCard card = usedCards.removeLast();

        if (card.isColorSelect) {
          card = card.copyWith(color: CardColor.blank);
        } else if (card.isReverse) {
          clockwise = !clockwise;
        } else if (card.isSkip) {
          recedePlayer();
        }

        updatePlayer(
          player!.copyWith(hand: Map.from(player.hand)..[card.id] = card),
        );
        recedePlayer();
      }
    }
  }

  void playCard(String playerName, Map<String, dynamic> message) {
    final player = players[playerName];

    final card = OneCard.fromJson(message[playCardKey]);
    final lastCard = usedCards.last;

    if (card.sameCard(lastCard)) {
      currentPlayer = playerName;
    } else if (playerName != currentPlayer) {
      return;
    }

    if (lastCard.color == card.color ||
        lastCard.value == card.value ||
        card.isColorSelect) {
      if (card.isReverse) {
        clockwise = !clockwise;
      } else if (card.isSkip) {
        advancePlayer();
      }
      usedCards.add(card.copyWith(player: playerName));
      updatePlayer(
        player!.copyWith(hand: Map.from(player.hand)..remove(card.id)),
      );
      advancePlayer();
    }
  }
}
