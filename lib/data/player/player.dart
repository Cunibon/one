import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:one/data/one_card/one_card.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'player.freezed.dart';

@freezed
abstract class Player with _$Player {
  const factory Player({
    required String name,
    required List<OneCard> hand,
    required WebSocketChannel channel,
  }) = _Player;
}
