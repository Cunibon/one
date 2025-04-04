import 'package:one/data/game_logik/game_logik.dart';
import 'package:one/data/one_card/one_card.dart';
import 'package:one/data/player/player.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

extension NetworkGameLogik on GameLogik {
  void register(String playerName, WebSocketChannel channel) {
    if (disconnectedPlayers.containsKey(playerName)) {
      final player = disconnectedPlayers
          .remove(playerName)!
          .copyWith(channel: channel);

      updatePlayer(player);
    } else {
      final Map<String, OneCard> playerHand = {};

      for (int i = 0; i < 7; i++) {
        final currentCard = deck.removeLast();
        playerHand[currentCard.id] = currentCard;
        reshuffelDeck();
      }

      updatePlayer(
        Player(name: playerName, hand: playerHand, channel: channel),
      );
    }

    if (currentPlayer == "") {
      currentPlayer = playerName;
    }
  }

  void disconnectPlayer(WebSocketChannel channel) {
    for (final player in players.values) {
      if (player.channel == channel) {
        disconnectedPlayers[player.name] = players.remove(player.name)!;
        if (player.name == currentPlayer) {
          advancePlayer();
        }
        break;
      }
    }
    updateGameState();
  }
}
