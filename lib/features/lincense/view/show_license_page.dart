import 'package:diary_report_sample/providers/package_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowLicencePage extends ConsumerWidget {
  const ShowLicencePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfoState = ref.watch(packageInfoProvider);
    return packageInfoState.when(
        data: (data) => LicensePage(
              applicationName: packageInfoState.value?.appName ?? '',
              applicationIcon:
                  Image.asset('assets/images/rogo-typeB.png', height: 80),
              applicationVersion: packageInfoState.value?.version ?? '',
            ),
        loading: () => const CircularProgressIndicator(),
        error: (e, st) => Container());
  }
}
