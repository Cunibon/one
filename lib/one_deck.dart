import 'package:one/application_constants.dart';
import 'package:one/data/one_card/one_card.dart';
import 'package:one/data/one_card/one_card_enums.dart';
import 'package:random_string/random_string.dart';

List<OneCard> _oneDeck() => [
  //Standard numbers
  for (int i = 0; i < 10; i++)
    OneCard(id: randomAlpha(10), value: "$i", color: CardColor.red),
  for (int i = 0; i < 10; i++)
    OneCard(id: randomAlpha(10), value: "$i", color: CardColor.green),
  for (int i = 0; i < 10; i++)
    OneCard(id: randomAlpha(10), value: "$i", color: CardColor.blue),
  for (int i = 0; i < 10; i++)
    OneCard(id: randomAlpha(10), value: "$i", color: CardColor.yellow),
  //Standard numbers without 0
  for (int i = 1; i < 10; i++)
    OneCard(id: randomAlpha(10), value: "$i", color: CardColor.red),
  for (int i = 1; i < 10; i++)
    OneCard(id: randomAlpha(10), value: "$i", color: CardColor.green),
  for (int i = 1; i < 10; i++)
    OneCard(id: randomAlpha(10), value: "$i", color: CardColor.blue),
  for (int i = 1; i < 10; i++)
    OneCard(id: randomAlpha(10), value: "$i", color: CardColor.yellow),
  //Specials colored
  for (int i = 0; i < 2; i++) ...[
    OneCard(id: randomAlpha(10), value: skipCardType, color: CardColor.red),
    OneCard(id: randomAlpha(10), value: reverseCardType, color: CardColor.red),
    OneCard(id: randomAlpha(10), value: draw2CardType, color: CardColor.red),
  ],
  for (int i = 0; i < 2; i++) ...[
    OneCard(id: randomAlpha(10), value: skipCardType, color: CardColor.green),
    OneCard(
      id: randomAlpha(10),
      value: reverseCardType,
      color: CardColor.green,
    ),
    OneCard(id: randomAlpha(10), value: draw2CardType, color: CardColor.green),
  ],
  for (int i = 0; i < 2; i++) ...[
    OneCard(id: randomAlpha(10), value: skipCardType, color: CardColor.blue),
    OneCard(id: randomAlpha(10), value: reverseCardType, color: CardColor.blue),
    OneCard(id: randomAlpha(10), value: draw2CardType, color: CardColor.blue),
  ],
  for (int i = 0; i < 2; i++) ...[
    OneCard(id: randomAlpha(10), value: skipCardType, color: CardColor.yellow),
    OneCard(
      id: randomAlpha(10),
      value: reverseCardType,
      color: CardColor.yellow,
    ),
    OneCard(id: randomAlpha(10), value: draw2CardType, color: CardColor.yellow),
  ],
  //Specials
  for (int i = 0; i < 4; i++)
    OneCard(id: randomAlpha(10), value: selectCardType, color: CardColor.blank),
  for (int i = 0; i < 4; i++)
    OneCard(id: randomAlpha(10), value: draw4CardType, color: CardColor.blank),
];

List<OneCard> newDeck() => List.from(_oneDeck())..shuffle();
