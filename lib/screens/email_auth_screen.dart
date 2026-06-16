import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main_navigation_screen.dart';

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({super.key});

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  Future<void> forgotPassword() async {
    if (emailController.text.trim().isEmpty) {
      showMessage("Enter your email first.");
      return;
    }

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(
        email: emailController.text.trim(),
      );

      showMessage(
        "Password reset email sent.",
      );
    } on FirebaseAuthException catch (e) {
      showMessage(
        e.message ?? "Failed to send reset email.",
      );
    }
  }
  Future<void> resendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      await user?.sendEmailVerification();

      showMessage(
        "Verification email sent again.",
      );
    } catch (e) {
      showMessage(
        "Failed to send verification email.",
      );
    }
  }
  bool isLogin = true;
  bool isLoading = false;

  Future<void> authenticate() async {
    if (!isLogin &&
        passwordController.text.trim() !=
            confirmPasswordController.text.trim()) {
      showMessage("Passwords do not match");
      return;
    }

    setState(() => isLoading = true);

    try {
      if (isLogin) {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        await credential.user?.reload();

        if (credential.user!.emailVerified) {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const MainNavigationScreen(),
              ),
            );
          }
        } else {
          await FirebaseAuth.instance.signOut();

          showMessage(
            "Please verify your email. Check your inbox or use Resend Email.",
          );
        }
      } else {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        await credential.user?.sendEmailVerification();
        await FirebaseAuth.instance.signOut();

        showMessage(
          "Verification email sent. Please check your inbox.",
        );

        setState(() {
          isLogin = true;
        });
      }
    } on FirebaseAuthException catch (e) {
      showMessage(e.message ?? "Authentication failed");
    } finally {
      setState(() => isLoading = false);
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        title: Text(
          isLogin ? "Login" : "Create Account",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [
            const SizedBox(height: 20),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,

              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,

              decoration: const InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            if (isLogin)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: forgotPassword,
                  child: const Text(
                    "Forgot Password?",
                  ),
                ),
              ),

            if (!isLogin) ...[
              const SizedBox(height: 20),

              TextField(
                controller: confirmPasswordController,
                obscureText: true,

                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  prefixIcon: Icon(Icons.lock_reset),
                ),
              ),
            ],

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: isLoading ? null : authenticate,

                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                  isLogin
                      ? "Login"
                      : "Create Account",
                ),
              ),
            ),
            if (isLogin)
              TextButton(
                onPressed: resendVerificationEmail,
                child: const Text(
                  "Resend Verification Email",
                ),
              ),

            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },

              child: Text(
                isLogin
                    ? "Don't have an account? Sign Up"
                    : "Already have an account? Login",
              ),
            ),
          ],
        ),
      ),
    );
  }
}