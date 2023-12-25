// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/loading_widget.dart';
import 'pods/home_pods.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const int totalImages = 50;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catUrlList = ref.watch(catUrlListProvider(totalImages));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gatinhos de Fubá'),
        ),
        floatingActionButton: SizedBox(
          width: 250,
          child: ElevatedButton(
              onPressed: () {
                ref.invalidate(catUrlListProvider);
              },
              child: const Text('Atualizar Lista 🐈')),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: catUrlList.when(
              data: (urlList) {
                if (catUrlList.isReloading || catUrlList.isRefreshing) {
                  return const LoadingWidget();
                }
                if (urlList == null || urlList.isEmpty) {
                  return const Center(child: Text('Houve um erro'));
                }
                return Padding(
                  key: ValueKey(urlList.hashCode),
                  padding: const EdgeInsets.all(20.0),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisExtent: 250,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    children: urlList.map((e) {
                      return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        child: CachedNetworkImage(
                          imageUrl: e,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
              error: (error, _) => Text(error.toString()),
              loading: () => const LoadingWidget()),
        ));
  }
}
