import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one/application_constants.dart';
import 'package:one/data/client.dart';
import 'package:one/data/game_state/game_state.dart';
import 'package:one/screens/game/confirmation_dialog.dart';
import 'package:one/screens/game/game_view.dart';
import 'package:one/screens/game/user_ip_widget.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ip = ref.watch(serverIPProvider);
    AsyncValue<GameState> gameState = ref.watch(clientProvider);

    final isHost = ip == localHost;

    return Scaffold(
      appBar: AppBar(
        title:
            isHost
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserIpWidget(),
                    TextButton(
                      onPressed: () async {
                        final result = await showDialog(
                          context: context,
                          builder:
                              (context) =>
                                  ConfirmationDialog(title: "Restart game?"),
                        );
                        if (result == true) {
                          ref.read(clientProvider.notifier).restart();
                        }
                      },
                      child: Text(
                        "Restart",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
                : null,
      ),
      body: switch (gameState) {
        AsyncValue(:final error?) => Text('Error: $error'),
        AsyncValue(:final value?) => GameView(gameState: value),
        _ => Center(child: const CircularProgressIndicator()),
      },
    );
  }
}
