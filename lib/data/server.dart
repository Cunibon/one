import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one/application_constants.dart';
import 'package:one/data/game_state/game_state.dart';
import 'package:one/data/one_card/one_card.dart';
import 'package:one/data/one_card/one_card_enums.dart';
import 'package:one/data/player/player.dart';
import 'package:one/one_deck.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'server.g.dart';

@riverpod
Future<Server> initServer(Ref ref) async {
  final server = Server();
  await server.initServer();

  ref.onDispose(server.onDispose);

  return server;
}

class Server {
  late HttpServer server;
  final Map<String, Player> players = {};
  final Map<String, Player> disconnectedPlayers = {};

  List<OneCard> usedCards = [];
  List<OneCard> deck = newDeck();

  bool clockwise = true;

  void reshuffelDeck() {
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
            myHand: player.hand,
            clockwise: clockwise,
          ),
        ),
      );
    }
  }

  Future<void> initServer() async {
    usedCards.add(deck.removeLast());

    final handler = webSocketHandler((webSocket, _) {
      String? playerName;

      webSocket.stream.listen(
        (data) async {
          final Map<String, dynamic> message = jsonDecode(data);

          final player = players[playerName];

          if (message.containsKey(drawCardKey)) {
            updatePlayer(
              player!.copyWith(
                hand: List.from(player.hand)..add(deck.removeLast()),
              ),
            );
            reshuffelDeck();
          } else if (message.containsKey(takeCardKey)) {
            if (usedCards.length > 1) {
              updatePlayer(
                player!.copyWith(
                  hand: List.from(player.hand)..add(usedCards.removeLast()),
                ),
              );
            }
          } else if (message.containsKey(playCardKey)) {
            final card = OneCard.fromJson(message[playCardKey]);
            final lastCard = usedCards.lastOrNull;
            if (lastCard == null ||
                lastCard.color == card.color ||
                card.color == CardColor.blank ||
                lastCard.color == CardColor.blank ||
                lastCard.value == card.value) {
              usedCards.add(card);
              updatePlayer(
                player!.copyWith(hand: List.from(player.hand)..remove(card)),
              );
            }
          } else if (message.containsKey(registerKey)) {
            playerName = message[registerKey];

            if (disconnectedPlayers.containsKey(playerName)) {
              final player = disconnectedPlayers
                  .remove(playerName)!
                  .copyWith(channel: webSocket);

              updatePlayer(player);
            } else {
              final List<OneCard> playerHand = [];

              for (int i = 0; i < 7; i++) {
                playerHand.add(deck.removeLast());
                reshuffelDeck();
              }

              updatePlayer(
                Player(
                  name: message[registerKey],
                  hand: playerHand,
                  channel: webSocket,
                ),
              );
            }
          }

          updateGameState();
        },
        onDone: () => disconnectPlayer(webSocket),
        onError: (e) => disconnectPlayer(webSocket),
      );
    });

    server = await shelf_io.serve(handler, InternetAddress.anyIPv4, 8080);
  }

  void onDispose() async {
    server.close();
  }
}
