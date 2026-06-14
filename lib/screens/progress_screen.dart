import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

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

                // FIX: was hardcoded Colors.white
                Text(
                  "Your Progress",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // FIX: was hardcoded Colors.white70
                Text(
                  "Track your English speaking improvement.",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 35),

                // Overall Score Card — gradient raha, theek hai
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),

                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF2563EB),
                        Color(0xFF7C3AED),
                      ],
                    ),
                  ),

                  child: const Column(
                    children: [

                      Text(
                        "Overall Speaking Score",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(height: 20),

                      Text(
                        "81%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Excellent Progress 🚀",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // FIX: was hardcoded Colors.white
                Text(
                  "Performance Metrics",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                metricCard(
                  context: context,
                  title: "Pronunciation",
                  score: "82%",
                  color: Colors.greenAccent,
                ),

                const SizedBox(height: 16),

                metricCard(
                  context: context,
                  title: "Fluency",
                  score: "76%",
                  color: Colors.orangeAccent,
                ),

                const SizedBox(height: 16),

                metricCard(
                  context: context,
                  title: "Confidence",
                  score: "80%",
                  color: Colors.cyanAccent,
                ),

                const SizedBox(height: 35),

                // FIX: was hardcoded Colors.white
                Text(
                  "Weekly Activity",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
                    // FIX: was hardcoded, uses theme now
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(22),
                  ),

                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      activityDay("M"),
                      activityDay("T"),
                      activityDay("W"),
                      activityDay("T"),
                      activityDay("F"),
                      activityDay("S"),
                      activityDay("S"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget metricCard({
    required BuildContext context,
    required String title,
    required String score,
    required Color color,
  }) {

    return Container(
      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        // FIX: was hardcoded Color(0xFF1E293B)
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // FIX: was hardcoded Colors.white
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 18,
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),

            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),

            child: Text(
              score,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class activityDay extends StatelessWidget {

  final String day;

  const activityDay(this.day, {super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 45,
      width: 45,

      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.2),
        shape: BoxShape.circle,
      ),

      child: Center(
        child: Text(
          day,
          style: TextStyle(
            // already using Theme — was correct
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
