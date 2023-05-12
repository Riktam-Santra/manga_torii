import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:manga_torii/services/enums/side_bar_state.dart';

class SideBarStateNotifier extends StateNotifier<SideBarState> {
  SideBarStateNotifier() : super(SideBarState.HomePage);

  void setState(SideBarState newState) {
    state = newState;
    log('SideBarState changed to: $newState');
  }
}

final sideBarStateProvider =
    StateNotifierProvider<SideBarStateNotifier, SideBarState>((ref) {
  return SideBarStateNotifier();
});
