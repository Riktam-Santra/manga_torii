import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:manga_torii/services/enums/side_bar_state.dart';
import 'package:manga_torii/services/providers/app_bar_state_provider.dart';

class SideBar extends ConsumerStatefulWidget {
  const SideBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SideBarState();
}

class _SideBarState extends ConsumerState<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10),
                  child: Tooltip(
                    message: "Home",
                    child: IconButton(
                      onPressed: () {
                        ref
                            .read(sideBarStateProvider.notifier)
                            .setState(SideBarState.HomePage);
                      },
                      icon: const Icon(
                        Icons.home,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10),
                  child: Tooltip(
                    message: "Settings",
                    child: IconButton(
                      onPressed: () {
                        ref
                            .read(sideBarStateProvider.notifier)
                            .setState(SideBarState.Settings);
                      },
                      icon: const Icon(
                        Icons.settings,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10),
                  child: Tooltip(
                    message: "About",
                    child: IconButton(
                      onPressed: () {
                        ref
                            .read(sideBarStateProvider.notifier)
                            .setState(SideBarState.About);
                      },
                      icon: const Icon(
                        Icons.info,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
