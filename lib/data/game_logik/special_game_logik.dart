import 'package:one/application_constants.dart';
import 'package:one/data/game_logik/game_logik.dart';

extension SpecialGameLogik on GameLogik {
  void switchHands() {
    if (usedCards.last.is0) {
      final playerNames = players.keys.toList();
      final playerHands = players.values.map((e) => e.hand).toList();

      if (clockwise) {
        final lastHand = playerHands.removeLast();
        playerHands.insert(0, lastHand);
      } else {
        final firstHand = playerHands.removeAt(0);
        playerHands.add(firstHand);
      }

      for (int i = 0; i < playerNames.length; i++) {
        updatePlayer(players[playerNames[i]]!.copyWith(hand: playerHands[i]));
      }
    }
  }

  void switchPlayerHands(String playerName, Map<String, dynamic> message) {
    if (usedCards.last.is7 && usedCards.last.player == playerName) {
      final otherPlayerName = message[switchPlayerHandsKey];

      final player = players[playerName];
      final otherPlayer = players[otherPlayerName];
      if (player == null || otherPlayer == null) return;

      final playerHand = player.hand;
      updatePlayer(player.copyWith(hand: otherPlayer.hand));
      updatePlayer(otherPlayer.copyWith(hand: playerHand));
    }
  }
}
