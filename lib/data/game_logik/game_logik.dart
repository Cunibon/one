import 'dart:convert';

import 'package:one/data/game_state/game_state.dart';
import 'package:one/data/one_card/one_card.dart';
import 'package:one/data/player/player.dart';
import 'package:one/one_deck.dart';

class GameLogik {
  GameLogik() {
    usedCards.add(deck.removeLast());
  }

  final Map<String, Player> players = {};
  final Map<String, Player> disconnectedPlayers = {};

  List<OneCard> usedCards = [];
  List<OneCard> deck = newDeck();

  bool clockwise = true;
  String currentPlayer = "";

  void reshuffelDeck() {
    if (deck.isEmpty) {
      final cardsInGame = players.values.expand((e) => e.hand.values);
      deck = newDeck();
      for (final card in cardsInGame) {
        for (final freshCard in deck) {
          if (card.sameCard(freshCard)) {
            deck.remove(freshCard);
            break;
          }
        }
      }
    }
  }

  void updatePlayer(Player player) {
    players[player.name] = player;
  }

  void updateGameState() {
    final simplePlayerCards = players.map(
      (key, value) => MapEntry(key, value.hand.length),
    );

    for (final player in players.values) {
      player.channel.sink.add(
        jsonEncode(
          GameState(
            lastPlayed: usedCards.last,
            playerCards: simplePlayerCards,
            myHand: player.hand.values.toList(),
            currentPlayer: currentPlayer,
            clockwise: clockwise,
          ),
        ),
      );
    }
  }

  void skipTurn(String playerName) {
    if (currentPlayer != playerName) return;
    advancePlayer();
  }

  void advancePlayer({int steps = 1}) =>
      movePlayer((clockwise ? 1 : -1) * steps);
  void recedePlayer({int steps = 1}) =>
      movePlayer((clockwise ? -1 : 1) * steps);

  void movePlayer(int operator) {
    final playerNames = players.keys.toList();
    int index = playerNames.indexOf(currentPlayer) + operator;

    if (index < 0) {
      index = playerNames.length - 1;
    } else if (index >= playerNames.length) {
      index = 0;
    }

    currentPlayer = playerNames[index];
  }
}
