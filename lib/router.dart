import 'dart:async';

import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:go_router/go_router.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:kg_meet_tpe/presentation/generate_result_screen.dart';
import 'package:kg_meet_tpe/presentation/generate_wallet_screen.dart';

part 'router.g.dart';

@TypedGoRoute<GenerateWalletRoute>(
  path: '/generate',
  routes: [TypedGoRoute<GenerateResultRoute>(path: 'result')],
)
class GenerateWalletRoute extends GoRouteData {
  @override
  Widget build(context, state) {
    return const GenerateWalletScreen();
  }
}

class GenerateResultRoute extends GoRouteData {
  @override
  Page<void> buildPage(context, state) {
    final resultInfo = state.extra as GenerateResultInfo?;
    return NoTransitionPage(
        child: GenerateResultScreen(
            resultInfo: resultInfo ??
                const GenerateResultInfo(
                    name: 'Alice',
                    birth: '05-01',
                    address: '0x4185ca9b59745f767469B6a3E0066188e5E5c5e4',
                    privateKey: 'pk1')));
  }

  // @override
  // FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
  //   if (state.extra == null) {
  //     return GenerateWalletRoute().location;
  //   }
  //   return super.redirect(context, state);
  // }
}
