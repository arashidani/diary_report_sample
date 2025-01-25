// lib/presentation/screens/login_page.dart
import 'package:diary_report_sample/4_presentation/router/routes.dart';
import 'package:diary_report_sample/features/root/providers/auth_state_provider.dart';
import 'package:diary_report_sample/features/root/view/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // firebaseAuthServiceProvider を利用してサインインを実施
      final firebaseAuthService = ref.read(firebaseAuthServiceProvider);
      await firebaseAuthService.signInWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // サインイン成功時の処理（例：ホーム画面への遷移）
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login successful")),
      );

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const RootView(),
        ),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: $e")),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Email Input Field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "example@domain.com",
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value.trim())) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Password Input Field
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.trim().length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Sign In Button or Loader
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submit,
                      child: const Text("Login"),
                    ),
              const SizedBox(height: 8),
              // Forget Password Text
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.forgetPasswordPage);
                  },
                  child: const Text("Forget your password?"),
                ),
              ),
              const SizedBox(height: 12),
              // Divider
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("OR"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 12),
              // Sign In with Google Button
              SignInButton(Buttons.google, onPressed: () async {
                // Google Sign Inする
                await _signInWithGoogle();
              }),
              const SizedBox(height: 12),
              // Don't Have an Account Section
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.signupPage),
                  child: const Text("Don't have an account? Sign up here"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Placeholder for Google Sign-In function
  Future<void> _signInWithGoogle() async {
    try {
      // Logic for Google Sign-In
      final firebaseAuthService = ref.read(firebaseAuthServiceProvider);
      await firebaseAuthService.signInWithGoogle();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Google Sign-In successful")),
      );

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const RootView(),
        ),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google Sign-In failed: $e")),
      );
    }
  }
}
