import 'dart:convert';

import 'package:one/application_constants.dart';
import 'package:one/data/game_state/game_state.dart';
import 'package:one/data/one_card/one_card.dart';
import 'package:one/data/one_card/one_card_enums.dart';
import 'package:one/data/player/player.dart';
import 'package:one/one_deck.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class GameLogik {
  GameLogik() {
    usedCards.add(deck.removeLast());
  }

  final Map<String, Player> players = {};
  final Map<String, Player> disconnectedPlayers = {};

  List<OneCard> usedCards = [];
  List<OneCard> deck = newDeck();

  bool clockwise = true;

  void _reshuffelDeck() {
    if (deck.isEmpty) {
      final cardsInGame = players.values.expand((e) => e.hand);
      deck = newDeck()..removeWhere((e) => cardsInGame.contains(e));
    }
  }

  void disconnectPlayer(WebSocketChannel channel) {
    for (final player in players.values) {
      if (player.channel == channel) {
        disconnectedPlayers[player.name] = players.remove(player.name)!;
        break;
      }
    }
    updateGameState();
  }

  void _updatePlayer(Player player) {
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
            myHand: player.hand,
            clockwise: clockwise,
          ),
        ),
      );
    }
  }

  void drawCard(String playerName) {
    final player = players[playerName];
    _updatePlayer(
      player!.copyWith(hand: List.from(player.hand)..add(deck.removeLast())),
    );
    _reshuffelDeck();
  }

  void takeCard(String playerName) {
    final player = players[playerName];

    if (usedCards.length > 1) {
      final lastCard = usedCards.last;
      if (lastCard.player == playerName) {
        _updatePlayer(
          player!.copyWith(
            hand: List.from(player.hand)
              ..add(usedCards.removeLast().copyWith(player: null)),
          ),
        );
      }
    }
  }

  void playCard(String playerName, Map<String, dynamic> message) {
    final player = players[playerName];

    final card = OneCard.fromJson(message[playCardKey]);
    final lastCard = usedCards.lastOrNull;
    if (lastCard == null ||
        lastCard.color == card.color ||
        card.color == CardColor.blank ||
        lastCard.color == CardColor.blank ||
        lastCard.value == card.value) {
      usedCards.add(card.copyWith(player: playerName));
      _updatePlayer(
        player!.copyWith(hand: List.from(player.hand)..remove(card)),
      );
    }
  }

  void register(String playerName, WebSocketChannel channel) {
    if (disconnectedPlayers.containsKey(playerName)) {
      final player = disconnectedPlayers
          .remove(playerName)!
          .copyWith(channel: channel);

      _updatePlayer(player);
    } else {
      final List<OneCard> playerHand = [];

      for (int i = 0; i < 7; i++) {
        playerHand.add(deck.removeLast());
        _reshuffelDeck();
      }

      _updatePlayer(
        Player(name: playerName, hand: playerHand, channel: channel),
      );
    }
  }
}
