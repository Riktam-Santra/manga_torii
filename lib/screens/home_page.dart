import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:manga_torii/services/providers/top_manga_future_provider.dart';
import 'package:mangadex_library/mangadex_library.dart' as manga_lib;
import 'package:mangadex_library/utils.dart';

import '../widgets/side_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SideBar(),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Consumer(
                    builder: (context, ref, child) {
                      return ref.watch(topMangaFutureProvider).when(
                            data: (data) {
                              return Card(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CachedNetworkImage(
                                          imageUrl:
                                              'https://uploads.mangadex.org/covers/${data.data![0].id!}/${data.data![0].relationships!.firstWhere((element) => element.type == 'cover_art').attributes!.fileName!}.256.jpg'),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                data.data?[0].attributes?.title
                                                        ?.en ??
                                                    '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge,
                                              ),
                                              Divider(),
                                              Text(data.data?[0].attributes
                                                      ?.description?.en ??
                                                  ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            error: (err, stktrc) => Container(),
                            loading: () => Center(
                              child: LinearProgressIndicator(),
                            ),
                          );
                    },
                  )),
                ],
              )
            ],
          ),
        )),
      ],
    );
  }
}
