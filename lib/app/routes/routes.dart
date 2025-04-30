import 'package:flutter/material.dart';
import 'package:foot_app/core/scaffold/custom_scaffold.dart';
import 'package:foot_app/pages/home/home.dart';
import 'package:foot_app/pages/new_shift/new_shift.dart';
import 'package:foot_app/pages/players_home/players_home.dart';
import 'package:foot_app/pages/shift_details/shift_details.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return CustomScaffold(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomePage(),
            ),
            GoRoute(
              path: '/home_players',
              builder: (context, state) => const PlayersHomePage(),
            ),
            GoRoute(
              path: '/shifts_details/:selectedDate',
              builder: (context, state) {
                var selectedDateTime = DateTime.now();
                final selectedDate = state.pathParameters['selectedDate'];

                if (selectedDate != null) {
                  selectedDateTime = DateTime.parse(selectedDate);
                }

                return ShiftDetailsPage(
                  selectedDate: selectedDateTime,
                );
              },
            ),
            GoRoute(
              path: '/new_shift',
              builder: (context, state) {
                return const NewShiftPage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
