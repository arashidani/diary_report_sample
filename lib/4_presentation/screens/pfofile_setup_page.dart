// lib/presentation/screens/profile_setup_page.dart
import 'package:diary_report_sample/1_domain/models/firebase/users/users.dart';
import 'package:diary_report_sample/4_presentation/providers/user_provider.dart';
import 'package:diary_report_sample/4_presentation/router/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart' hide Router;

class ProfileSetupPage extends ConsumerStatefulWidget {
  const ProfileSetupPage({Key? key, required this.authUser}) : super(key: key);
  final User authUser;

  @override
  ConsumerState<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends ConsumerState<ProfileSetupPage> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // userServiceProvider を通じて UserService を取得
      final userService = ref.read(userServiceProvider);

      // ユーザー ID は、実際は認証済みのユーザーIDや
      final userId = widget.authUser.uid;
      final newUser = Users(
        docId: userId,
        lastName: _lastNameController.text.trim(),
        firstName: _firstNameController.text.trim(),
        name:
            '${_lastNameController.text.trim()} ${_firstNameController.text.trim()}',
        role: 'user',
        projects: const [],
      );

      await userService.updateUser(newUser);

      // 作成成功時のフィードバック
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile created successfully!")),
      );
      Navigator.of(context)
          .pushNamed(Routes.topView); // 必要に応じて、次の画面へ遷移するなどの処理を行う
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to create profile: $e")),
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
      appBar: AppBar(title: const Text("Profile Setup")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // First Name 入力
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Last Name 入力
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submit,
                      child: const Text("Create Profile"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
