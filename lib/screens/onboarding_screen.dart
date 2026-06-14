import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController _controller = PageController();

  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Improve Your Pronunciation",
      "description":
      "Practice speaking English with AI-powered pronunciation feedback.",
    },
    {
      "title": "Track Your Progress",
      "description":
      "Monitor your fluency, confidence, and speaking improvement daily.",
    },
    {
      "title": "Speak With Confidence",
      "description":
      "Prepare for interviews, conversations, and life abroad confidently.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),

      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {

                  return Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.record_voice_over_rounded,
                            size: 90,
                            color: Colors.blueAccent,
                          ),
                        ),

                        const SizedBox(height: 50),

                        Text(
                          onboardingData[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                          onboardingData[index]["description"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: currentIndex == index ? 25 : 10,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.blueAccent
                        : Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {

                    if (currentIndex == onboardingData.length - 1) {

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const LoginScreen()
                        ),
                      );

                    } else {

                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    currentIndex == onboardingData.length - 1
                        ? "Get Started"
                        : "Next",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}