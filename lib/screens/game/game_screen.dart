import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one/application_constants.dart';
import 'package:one/data/client.dart';
import 'package:one/data/game_state/game_state.dart';
import 'package:one/screens/game/game_view.dart';
import 'package:one/screens/game/user_ip_widget.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({required this.serverIP, super.key});

  final String serverIP;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<GameState> gameState = ref.watch(clientProvider(serverIP));

    final isHost = serverIP == localHost;

    return Scaffold(
      appBar: AppBar(title: isHost ? UserIpWidget() : null),
      body: switch (gameState) {
        AsyncValue(:final error?) => Text('Error: $error'),
        AsyncValue(:final value?) => GameView(
          serverIP: serverIP,
          gameState: value,
        ),
        _ => Center(child: const CircularProgressIndicator()),
      },
    );
  }
}
