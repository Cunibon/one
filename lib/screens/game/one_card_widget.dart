import 'package:flutter/material.dart';
import 'package:one/application_constants.dart';
import 'package:one/data/one_card/one_card.dart';
import 'package:one/data/one_card/one_card_enums.dart';
import 'package:one/styles.dart';

class OneCardWidget extends StatelessWidget {
  const OneCardWidget({required this.card, required this.onTap, super.key});

  final void Function() onTap;
  final OneCard card;

  @override
  Widget build(BuildContext context) {
    late Widget innerWidget;

    switch (card.value) {
      case skipCardType:
        innerWidget = Icon(Icons.block, color: Colors.black, size: 100);
        break;
      case reverseCardType:
        innerWidget = Icon(Icons.sync, color: Colors.black, size: 100);
        break;
      case draw2CardType:
        innerWidget = Text("+2", style: cardTextStyle);
        break;
      case selectCardType:
        innerWidget = Icon(Icons.dataset, color: Colors.white, size: 100);
        break;
      case draw4CardType:
        innerWidget = Text(
          "+4",
          style: cardTextStyle.copyWith(color: Colors.white),
        );
        break;
      default:
        innerWidget = Text(card.value, style: cardTextStyle);
    }

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 400,
        child: Card(
          color: cardColorMap[card.color],
          child: Center(child: innerWidget),
        ),
      ),
    );
  }
}
