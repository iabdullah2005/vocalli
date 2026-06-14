import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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

                // Greeting
                Text(
                  "Hello Abdullah 👋",
                  style: TextStyle(
                    fontSize: 32,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Ready to improve your English today?",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 30),

                // Streak Card
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 20,
                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),

                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF2563EB),
                        Color(0xFF1D4ED8),
                      ],
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.25),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Daily Streak",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),

                          SizedBox(height: 12),

                          Row(
                            children: [

                              Icon(
                                Icons.local_fire_department,
                                color: Colors.orange,
                                size: 34,
                              ),

                              SizedBox(width: 10),

                              Text(
                                "7 Days",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // FIX: was hardcoded white, now uses cardColor
                      Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Icon(
                          Icons.emoji_events,
                          color: Colors.amber,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Practice Card
                Container(
                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
                    // FIX: uses theme cardColor
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(28),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "AI Speaking Practice",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        "Practice pronunciation and fluency with AI-powered feedback.",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 28),

                      SizedBox(
                        width: double.infinity,
                        height: 58,

                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.transparent,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),

                            padding: EdgeInsets.zero,
                          ),

                          onPressed: () {},

                          icon: const SizedBox(),

                          label: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),

                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF22D3EE),
                                  Color(0xFF2563EB),
                                ],
                              ),
                            ),

                            child: Container(
                              alignment: Alignment.center,

                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Icon(Icons.mic, color: Colors.white),

                                  SizedBox(width: 10),

                                  Text(
                                    "Start Practice",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // Progress Section
                Text(
                  "Your Progress",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: [

                    Expanded(
                      child: progressCard(
                        context: context,
                        title: "Pronunciation",
                        score: "82%",
                        icon: Icons.record_voice_over,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: progressCard(
                        context: context,
                        title: "Fluency",
                        score: "76%",
                        icon: Icons.speed,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget progressCard({
    required BuildContext context,
    required String title,
    required String score,
    required IconData icon,
  }) {

    return Container(
      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        // FIX: was hardcoded Color(0xFF1E293B), now uses theme
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Column(
        children: [

          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.12),
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              color: Colors.blueAccent,
              size: 32,
            ),
          ),

          const SizedBox(height: 18),

          // FIX: was hardcoded Colors.white
          Text(
            score,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // FIX: was hardcoded Colors.white70
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium?.color,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
