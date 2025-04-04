import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one/application_constants.dart';
import 'package:one/data/game_logik/default_game_logik.dart';
import 'package:one/data/game_logik/game_logik.dart';
import 'package:one/data/game_logik/network_game_logik.dart';
import 'package:one/data/game_logik/special_game_logik.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';

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
  final gameLogik = GameLogik();

  Future<void> initServer() async {
    final handler = webSocketHandler((webSocket, _) {
      String? playerName;

      webSocket.stream.listen(
        (data) async {
          final Map<String, dynamic> message = jsonDecode(data);

          if (message.containsKey(drawCardKey)) {
            gameLogik.drawCard(playerName!);
          } else if (message.containsKey(takeCardKey)) {
            gameLogik.takeCard(playerName!);
          } else if (message.containsKey(playCardKey)) {
            gameLogik.playCard(playerName!, message);
          } else if (message.containsKey(switchHandsKey)) {
            gameLogik.switchHands();
          } else if (message.containsKey(switchPlayerHandsKey)) {
            gameLogik.switchPlayerHands(playerName!, message);
          } else if (message.containsKey(skipKey)) {
            gameLogik.skipTurn(playerName!);
          } else if (message.containsKey(registerKey)) {
            playerName = message[registerKey];

            gameLogik.register(playerName!, webSocket);
          }

          gameLogik.updateGameState();
        },
        onDone: () => gameLogik.disconnectPlayer(webSocket),
        onError: (e) => gameLogik.disconnectPlayer(webSocket),
      );
    });

    server = await shelf_io.serve(handler, InternetAddress.anyIPv4, 8080);
  }

  void onDispose() async {
    server.close();
  }
}
