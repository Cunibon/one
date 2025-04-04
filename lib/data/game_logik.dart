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
  String currentPlayer = "";

  void _reshuffelDeck() {
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
            myHand: player.hand.values.toList(),
            clockwise: clockwise,
          ),
        ),
      );
    }
  }

  void drawCard(String playerName) {
    final player = players[playerName];
    final lastCard = deck.removeLast();
    _updatePlayer(
      player!.copyWith(hand: Map.from(player.hand)..[lastCard.id] = lastCard),
    );
    _reshuffelDeck();
  }

  void takeCard(String playerName) {
    final player = players[playerName];

    if (usedCards.length > 1) {
      final lastCard = usedCards.last;
      if (lastCard.player == playerName) {
        OneCard card = usedCards.removeLast();

        if (card.isColorSelect) {
          card = card.copyWith(color: CardColor.blank);
        }

        _updatePlayer(
          player!.copyWith(hand: Map.from(player.hand)..[card.id] = card),
        );
      }
    }
  }

  void playCard(String playerName, Map<String, dynamic> message) {
    final player = players[playerName];

    final card = OneCard.fromJson(message[playCardKey]);
    final lastCard = usedCards.last;
    if (lastCard.color == card.color ||
        lastCard.value == card.value ||
        card.isColorSelect) {
      usedCards.add(card.copyWith(player: playerName));
      _updatePlayer(
        player!.copyWith(hand: Map.from(player.hand)..remove(card.id)),
      );
    }
  }

  void advancePlayer() {
    final playerNames = players.keys.toList();
    int index = playerNames.indexOf(currentPlayer) + (clockwise ? 1 : -1);

    if (index < 0) {
      index = playerNames.length - 1;
    } else if (index >= playerNames.length) {
      index = 0;
    }

    currentPlayer = playerNames[index];
  }

  void register(String playerName, WebSocketChannel channel) {
    if (disconnectedPlayers.containsKey(playerName)) {
      final player = disconnectedPlayers
          .remove(playerName)!
          .copyWith(channel: channel);

      _updatePlayer(player);
    } else {
      final Map<String, OneCard> playerHand = {};

      for (int i = 0; i < 7; i++) {
        final currentCard = deck.removeLast();
        playerHand[currentCard.id] = currentCard;
        _reshuffelDeck();
      }

      _updatePlayer(
        Player(name: playerName, hand: playerHand, channel: channel),
      );
    }

    if (currentPlayer == "") {
      currentPlayer = playerName;
    }
  }
}
