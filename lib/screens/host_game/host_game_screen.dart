import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one/application_constants.dart';
import 'package:one/data/server.dart';
import 'package:one/screens/game/game_screen.dart';

class HostGameScreen extends ConsumerWidget {
  const HostGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Server> server = ref.watch(initServerProvider);

    if (server.isLoading) {
      return Center(child: const CircularProgressIndicator());
    } else if (server.hasError) {
      return Center(child: Text('Oops, something went wrong'));
    } else {
      return GameScreen(serverIP: localHost);
    }
  }
}
