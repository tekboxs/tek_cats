import 'package:riverpod/riverpod.dart';
import 'package:tek_cats/app/pages/home/pods/home_repository.dart';

final catUrlListProvider =
    FutureProvider.family.autoDispose<List<String>?, int>((
  ref,
  limit,
) async {
  return await CatsRepository.getUrlsWithLimit(limit);
});
