import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'email_auth_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser =
      await GoogleSignIn().signIn();

      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const MainNavigationScreen(),
          ),
        );
      }
    } catch (e) {
      debugPrint("Google Sign-In Error: $e");
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const Spacer(),

              // Logo
              Container(
                height: 120,
                width: 120,

                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(22),
                ),

                child: const Icon(
                  Icons.mic_rounded,
                  color: Colors.blueAccent,
                  size: 60,
                ),
              ),

              const SizedBox(height: 35),

              // Title
              const Text(
                "Welcome to Vocali",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 14),

              const Text(
                "Improve your English speaking with AI-powered feedback.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              // Google Button
              socialButton(
                context: context,
                title: "Continue with Google",
                icon: Icons.g_mobiledata,
                colors: const [
                  Color(0xFF4285F4),
                  Color(0xFF34A853),
                ],
                onPressed: () async {
                  await signInWithGoogle(context);
                },
              ),

              const SizedBox(height: 18),

              // login with email Button
              socialButton(
                context: context,
                title: "Continue with Email",
                icon: Icons.email_outlined,
                colors: const [
                  Color(0xFF6366F1),
                  Color(0xFF8B5CF6),
                ],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EmailAuthScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 25),

              // Guest Option
              TextButton(
                onPressed: () {

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const MainNavigationScreen(),
                    ),
                  );
                },

                child: const Text(
                  "Continue as Guest",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required List<Color> colors,
    required VoidCallback onPressed,
  }) {

    return SizedBox(
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

        onPressed: onPressed,

        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),

            gradient: LinearGradient(
              colors: colors,
            ),
          ),

          child: Container(
            alignment: Alignment.center,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(
                  icon,
                  color: Colors.white,
                  size: 32,
                ),

                const SizedBox(width: 12),

                Text(
                  title,
                  style:  TextStyle(
                    color:
                    Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}