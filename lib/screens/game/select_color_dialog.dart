import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one/data/one_card/one_card_enums.dart';
import 'package:one/styles.dart';

class SelectColorDialog extends StatelessWidget {
  const SelectColorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select Color", style: titleTextStyle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => context.pop(CardColor.red),
                child: Container(color: Colors.red, width: 100, height: 100),
              ),
              GestureDetector(
                onTap: () => context.pop(CardColor.green),
                child: Container(color: Colors.green, width: 100, height: 100),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => context.pop(CardColor.blue),
                child: Container(color: Colors.blue, width: 100, height: 100),
              ),
              GestureDetector(
                onTap: () => context.pop(CardColor.yellow),
                child: Container(color: Colors.yellow, width: 100, height: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
