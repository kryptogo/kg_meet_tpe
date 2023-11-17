import 'dart:async';

import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:go_router/go_router.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:kg_meet_tpe/presentation/generate_result_screen.dart';
import 'package:kg_meet_tpe/presentation/generate_wallet_screen.dart';

part 'router.g.dart';

@TypedGoRoute<GenerateWalletRoute>(
  path: '/generate',
  routes: [TypedGoRoute<GenerateResultRoute>(path: 'result/:encodedInfo')],
)
class GenerateWalletRoute extends GoRouteData {
  @override
  Widget build(context, state) {
    return const GenerateWalletScreen();
  }
}

class GenerateResultRoute extends GoRouteData {
  final String encodedInfo;

  GenerateResultRoute(this.encodedInfo);

  @override
  Page<void> buildPage(context, state) {
    final resultInfo = state.extra as GenerateResultInfo?;
    return NoTransitionPage(
        child: GenerateResultScreen(
            resultInfo: resultInfo ??
                GenerateResultInfo.fromEncodedSoulInfo(encodedInfo)));
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    var resultInfo = state.extra as GenerateResultInfo?;
    if (resultInfo == null) {
      try {
        resultInfo = GenerateResultInfo.fromEncodedSoulInfo(encodedInfo);
      } catch (e) {
        resultInfo = null;
      }
    }
    if (resultInfo == null) {
      return GenerateWalletRoute().location;
    }
    return super.redirect(context, state);
  }
}
