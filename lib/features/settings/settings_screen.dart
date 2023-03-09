import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            children: [
              SwitchListTile.adaptive(
                value: false,
                onChanged: (value) {},
                title: const Text("toggle DarkMode"),
                subtitle: const Text("Lightmode by default."),
              ),
              SwitchListTile.adaptive(
                value: ref.watch(playbackConfigProvider).isAutoplay,
                onChanged: (value) => ref
                    .read(playbackConfigProvider.notifier)
                    .setAutoplay(value),
                title: const Text("Auto Mute"),
                subtitle: const Text("Videos muted by default."),
              ),
              SwitchListTile.adaptive(
                value: ref.watch(playbackConfigProvider).isMuted,
                onChanged: (value) {
                  ref.read(playbackConfigProvider.notifier).setMuted(value);
                },
                title: const Text("Auto Play"),
                subtitle: const Text("Videos muted by default."),
              ),
              ListTile(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2024),
                  );

                  if (kDebugMode) {
                    print(date);
                  }

                  if (context.mounted) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (kDebugMode) {
                      print(time);
                    }
                  }

                  if (context.mounted) {
                    final booking = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2024),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData(
                            appBarTheme: const AppBarTheme(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (kDebugMode) {
                      print(booking);
                    }
                  }
                },
                title: const Text(
                  "What is your birthday?",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text("About this app..."),
              ),
              ListTile(
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text("Hi"),
                      content: const Text("Hello"),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () => Navigator.of(context).pop(),
                          isDestructiveAction: true,
                          child: const Text("yes"),
                        ),
                        CupertinoDialogAction(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("no"),
                        ),
                      ],
                    ),
                  );
                },
                title: const Text("Log out"),
              ),
              ListTile(
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text("Hi"),
                      actions: [
                        CupertinoActionSheetAction(
                            onPressed: () {}, child: const Text("asd"))
                      ],
                    ),
                  );
                },
                title: const Text("Log out(bottom)"),
              ),
              const AboutListTile()
            ],
          ),
        ),
      ),
    );
  }
}
