import 'package:flutter/material.dart';
import 'package:one/styles.dart';

class PlayerInfo extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? Colors.greenAccent : Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name, style: headerTextStyle.copyWith(color: Colors.black)),
              Text(
                "Count: $cardCount",
                style: headerTextStyle.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
