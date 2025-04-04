import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum CardColor {
  @JsonValue('blank')
  blank,
  @JsonValue('red')
  red,
  @JsonValue('green')
  green,
  @JsonValue('blue')
  blue,
  @JsonValue('yellow')
  yellow,
}

const cardColorMap = {
  CardColor.blank: Colors.white,
  CardColor.red: Colors.red,
  CardColor.green: Colors.green,
  CardColor.blue: Colors.blue,
  CardColor.yellow: Colors.yellow,
};
