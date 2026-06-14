import 'package:flutter/material.dart';
import '../main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Settings",
                  style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color,

                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 35),

                settingTile(
                  context: context,
                  icon: Icons.person_outline,
                  title: "Profile",
                ),

                settingTile(
                  context: context,
                  icon: Icons.notifications_none,
                  title: "Notifications",
                ),

                settingTile(
                  context: context,
                  icon: Icons.language,
                  title: "Language",
                ),

                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(22),
                  ),

                  child: InkWell(
                    borderRadius: BorderRadius.circular(22),

                    onTap: () {

                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Theme.of(context).cardColor,

                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),

                        builder: (context) {

                          return SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                const SizedBox(height: 20),

                                ListTile(
                                  leading: const Icon(Icons.phone_android),
                                  title: const Text("System Default"),

                                  onTap: () {
                                    VocaliApp.of(context)
                                        ?.changeTheme(ThemeMode.system);

                                    Navigator.pop(context);
                                  },
                                ),

                                ListTile(
                                  leading: const Icon(Icons.light_mode),
                                  title: const Text("Light Mode"),

                                  onTap: () {
                                    VocaliApp.of(context)
                                        ?.changeTheme(ThemeMode.light);

                                    Navigator.pop(context);
                                  },
                                ),

                                ListTile(
                                  leading: const Icon(Icons.dark_mode),
                                  title: const Text("Dark Mode"),

                                  onTap: () {
                                    VocaliApp.of(context)
                                        ?.changeTheme(ThemeMode.dark);

                                    Navigator.pop(context);
                                  },
                                ),

                                const SizedBox(height: 20),
                              ],
                            ),
                          );
                        },
                      );
                    },

                    child: Row(
                      children: [

                        const Icon(
                          Icons.palette_outlined,
                          color: Colors.blueAccent,
                        ),

                        const SizedBox(width: 18),

                        Text(
                          "Theme",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.color,
                            fontSize: 18,
                          ),
                        ),

                        const Spacer(),

                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).brightness ==
                              Brightness.dark
                              ? Colors.white54
                              : Colors.black45,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),

                settingTile(
                  context: context,
                  icon: Icons.info_outline,
                  title: "About Vocali",
                ),

                settingTile(
                  context: context,
                  icon: Icons.logout,
                  title: "Logout",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget settingTile({
    required BuildContext context,
    required IconData icon,
    required String title,
  }) {

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Row(
        children: [

          Icon(
            icon,
            color: Colors.blueAccent,
          ),

          const SizedBox(width: 18),

          Text(
            title,
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.color,

              fontSize: 18,
            ),
          ),

          const Spacer(),

          Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).brightness ==
                Brightness.dark
                ? Colors.white54
                : Colors.black45,

            size: 18,
          ),
        ],
      ),
    );
  }
}