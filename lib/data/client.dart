import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:one/application_constants.dart';
import 'package:one/data/game_state/game_state.dart';
import 'package:one/data/one_card/one_card.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'client.g.dart';

@riverpod
class Client extends _$Client {
  late WebSocketChannel _channel;

  @override
  Stream<GameState> build(String ip) {
    _channel = WebSocketChannel.connect(Uri.parse('ws://$ip:8080'));

    _channel.sink.add(jsonEncode({registerKey: localStorage.getItem(nameKey)}));

    return _channel.stream.map(
      (event) => GameState.fromJson(jsonDecode(event)),
    );
  }

  void drawCard() {
    _channel.sink.add(jsonEncode({drawCardKey: true}));
  }

  void takeCard() {
    _channel.sink.add(jsonEncode({takeCardKey: true}));
  }

  void playCard(OneCard card) {
    _channel.sink.add(jsonEncode({playCardKey: card}));
  }
}
