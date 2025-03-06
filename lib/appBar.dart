import 'package:flutter/material.dart';
import 'package:daltons/pageStore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppStoreState state = ref.watch(appStoreProvider);
    final AppStore store = ref.read(appStoreProvider.notifier);

    return AppBar(
      centerTitle: true,
      title: TextButton(
        onPressed: () => store.openHome(context),
        child: const Text(
          'Flagdle',
          style: TextStyle(
            color: Colors.pinkAccent,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
