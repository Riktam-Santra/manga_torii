import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mangadex_library/enums/order_enums.dart';
import 'package:mangadex_library/mangadex_library.dart' as manga_lib;
import 'package:mangadex_library/models/search/search.dart';
import 'package:path_provider/path_provider.dart';

final topMangaFutureProvider = FutureProvider<Search>((ref) async {
  final Directory temp = await getTemporaryDirectory();

  final File file = File('${temp.path}/manga_cache/top10.json');

  if (await file.exists()) {
    final fileContents = await file.readAsString();
    log('Loading Top 10 from cache!');
    return Search.fromJson(jsonDecode(fileContents));
  } else {
    final top10Data = await manga_lib.search(
        orders: {SearchOrders.followedCount: OrderDirections.descending},
        includes: ['cover_art']);
    log('Fetched top 10 data from internet!');

    final newFile = await file.create(recursive: true);
    await newFile.writeAsString(jsonEncode(top10Data));

    return top10Data;
  }
});
