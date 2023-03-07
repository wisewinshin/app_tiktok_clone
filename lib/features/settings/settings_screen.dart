import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/common/widgets/configs/app_config.dart';
import 'package:tiktok_clone/common/widgets/configs/video_config.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
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
                value: context.watch<AppConfig>().isDarkMode,
                onChanged: (value) =>
                    context.read<AppConfig>().toggleDarkMode(),
                title: const Text("Aute Mute"),
                subtitle: const Text("Videos muted by default."),
              ),
              SwitchListTile.adaptive(
                value: context.watch<VideoConfig>().isMuted,
                onChanged: (value) =>
                    context.read<VideoConfig>().toggleIsMuted(),
                title: const Text("Aute Mute"),
                subtitle: const Text("Videos muted by default."),
              ),
              ListTile(
                onTap: () async {
                  if (!mounted) return;
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2024),
                  );

                  if (kDebugMode) {
                    print(date);
                  }

                  if (!mounted) return;
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (kDebugMode) {
                    print(time);
                  }

                  if (!mounted) return;
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
