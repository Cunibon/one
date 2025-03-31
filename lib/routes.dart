import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one/screens/game/game_screen.dart';
import 'package:one/screens/home_screen.dart';
import 'package:one/screens/host_game/host_game_screen.dart';
import 'package:one/screens/server_list/server_list_screen.dart';

final homeRoute = GoRoute(
  name: "root",
  path: '/',
  builder: (BuildContext context, GoRouterState state) {
    return const HomeScreen();
  },
  routes: [serverListRoute, gameHostRoute, gameRoute],
);

final serverListRoute = GoRoute(
  name: "serverList",
  path: 'serverList',
  builder: (BuildContext context, GoRouterState state) {
    return const ServerListScreen();
  },
);

final gameHostRoute = GoRoute(
  name: "gameHost",
  path: 'gameHost',
  builder: (BuildContext context, GoRouterState state) {
    return const HostGameScreen();
  },
);

final gameRoute = GoRoute(
  name: "game",
  path: 'game/:serverIP',
  builder: (BuildContext context, GoRouterState state) {
    return GameScreen(serverIP: state.pathParameters['serverIP']!);
  },
);
