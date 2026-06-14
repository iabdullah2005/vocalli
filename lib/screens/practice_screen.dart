import 'package:flutter/material.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen>
    with SingleTickerProviderStateMixin {

  bool isRecording = false;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.12,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // Header — FIX: was hardcoded Colors.white
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "AI Speaking Practice",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // FIX: was hardcoded Colors.white70
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Improve pronunciation and fluency with AI feedback.",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // Animated Mic Section — gradient hai, theek hai
                Container(
                  height: 220,
                  width: 220,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    gradient: RadialGradient(
                      colors: [
                        isRecording
                            ? Colors.purpleAccent.withOpacity(0.35)
                            : Colors.blueAccent.withOpacity(0.35),

                        isRecording
                            ? Colors.deepPurple.withOpacity(0.05)
                            : Colors.blueAccent.withOpacity(0.05),
                      ],
                    ),
                  ),

                  child: Center(
                    child: ScaleTransition(
                      scale: _scaleAnimation,

                      child: Container(
                        height: 120,
                        width: 120,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          gradient: LinearGradient(
                            colors: isRecording
                                ? [
                              const Color(0xFF8B5CF6),
                              const Color(0xFF6D28D9),
                            ]
                                : [
                              const Color(0xFF22D3EE),
                              const Color(0xFF2563EB),
                            ],
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: isRecording
                                  ? Colors.purpleAccent.withOpacity(0.45)
                                  : Colors.blueAccent.withOpacity(0.4),
                              blurRadius: 35,
                              spreadRadius: 5,
                            ),
                          ],
                        ),

                        child: const Icon(
                          Icons.mic_rounded,
                          color: Colors.white,
                          size: 55,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // FIX: was hardcoded Colors.white
                Text(
                  isRecording ? "Listening..." : "Tap To Speak",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                // FIX: was hardcoded Colors.white70
                Text(
                  isRecording
                      ? "AI is analyzing your speech..."
                      : "Your voice will be analyzed instantly",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 40),

                // Start Button
                SizedBox(
                  width: double.infinity,
                  height: 60,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      padding: EdgeInsets.zero,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    onPressed: () {

                      setState(() {
                        isRecording = !isRecording;
                      });

                      if (isRecording) {
                        _animationController.repeat(reverse: true);
                      } else {
                        _animationController.stop();
                        _animationController.reset();
                      }
                    },

                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        gradient: LinearGradient(
                          colors: isRecording
                              ? [
                            const Color(0xFF8B5CF6),
                            const Color(0xFF6D28D9),
                          ]
                              : [
                            const Color(0xFF22D3EE),
                            const Color(0xFF2563EB),
                          ],
                        ),
                      ),

                      child: Container(
                        alignment: Alignment.center,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            const Icon(Icons.mic, color: Colors.white),

                            const SizedBox(width: 10),

                            Text(
                              isRecording ? "Stop Recording" : "Start Recording",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Feedback Card — FIX: was hardcoded Color(0xFF1E293B)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
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

                      // FIX: was hardcoded Colors.white
                      Text(
                        "AI Feedback",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 25),

                      feedbackRow(
                        context: context,
                        title: "Pronunciation",
                        score: "82%",
                        color: Colors.greenAccent,
                      ),

                      const SizedBox(height: 20),

                      feedbackRow(
                        context: context,
                        title: "Fluency",
                        score: "76%",
                        color: Colors.orangeAccent,
                      ),

                      const SizedBox(height: 20),

                      feedbackRow(
                        context: context,
                        title: "Confidence",
                        score: "80%",
                        color: Colors.cyanAccent,
                      ),

                      const SizedBox(height: 30),

                      // FIX: was hardcoded Colors.white
                      Text(
                        "Words To Improve",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 18),

                      mistakeChip(context, "Comfortable"),
                      const SizedBox(height: 12),

                      mistakeChip(context, "Development"),
                      const SizedBox(height: 12),

                      mistakeChip(context, "Opportunity"),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget feedbackRow({
    required BuildContext context,
    required String title,
    required String score,
    required Color color,
  }) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        // FIX: was hardcoded Colors.white70
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
            fontSize: 16,
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),

          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(14),
          ),

          child: Text(
            score,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget mistakeChip(BuildContext context, String word) {

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      decoration: BoxDecoration(
        // FIX: was Colors.white.withOpacity(0.05) — invisible in light mode
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white.withOpacity(0.05)
            : Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [

          const Icon(
            Icons.error_outline,
            color: Colors.orangeAccent,
          ),

          const SizedBox(width: 12),

          Text(
            word,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
