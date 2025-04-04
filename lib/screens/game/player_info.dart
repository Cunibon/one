import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one/data/client.dart';
import 'package:one/styles.dart';

class PlayerInfo extends ConsumerWidget {
  const PlayerInfo({
    required this.name,
    required this.cardCount,
    required this.isActive,
    super.key,
  });

  final String name;
  final int cardCount;
  final bool isActive;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(clientProvider.notifier).switchPlayerHands(name),
      child: Card(
        color: isActive ? Colors.greenAccent : Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: headerTextStyle.copyWith(color: Colors.black),
                ),
                Text(
                  "Count: $cardCount",
                  style: headerTextStyle.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
