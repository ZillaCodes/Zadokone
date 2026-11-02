import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/supabase_client.dart';
import '../../theme/app_theme.dart';
import '../../widgets/shared_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false, _obscure = true;
  String? _message;
  Future<void> _createAccount() async {
    if (_email.text.trim().isEmpty || _password.text.length < 8) {
      setState(() => _message = 'Enter an email and a password with at least 8 characters.');
      return;
    }
    if (!Supabase.instance.isInitialized) {
      setState(() => _message = 'Configure Supabase to create an account.');
      return;
    }
    setState(() { _loading = true; _message = null; });
    try {
      final result = await supabase.auth.signUp(
        email: _email.text.trim(),
        password: _password.text,
        emailRedirectTo: Uri.base.toString(),
      );
      if (!mounted) return;
      if (result.session != null) {
        context.go('/home');
      } else {
        setState(() => _message = 'Account created. Check your email to confirm your address, then sign in.');
      }
    } on AuthException catch (error) {
      if (mounted) setState(() => _message = error.message);
    } catch (_) {
      if (mounted) setState(() => _message = 'Could not create your account. Please try again.');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }
  @override
  void dispose() { _email.dispose(); _password.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.cream,
    body: SafeArea(child: Center(child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 620),
      child: SingleChildScrollView(padding: const EdgeInsets.all(28), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ZadokLogo(),
          const SizedBox(height: 42),
          Text('Create an account', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          const Text('Start planning your homeownership journey with Zadok One.', style: TextStyle(color: AppColors.gray, height: 1.6)),
          const SizedBox(height: 28),
          ZadokTextField(controller: _email, hint: 'Email address', icon: Icons.mail_outline),
          const SizedBox(height: 16),
          ZadokTextField(controller: _password, hint: 'Password (8 characters minimum)', icon: Icons.lock_outline, password: true, obscure: _obscure, onToggle: () => setState(() => _obscure = !_obscure)),
          if (_message != null) Padding(padding: const EdgeInsets.only(top: 14), child: Text(_message!, style: const TextStyle(color: AppColors.maroon, fontSize: 12))),
          const SizedBox(height: 20),
          PrimaryButton(label: 'Create Account', loading: _loading, onPressed: _createAccount),
          const SizedBox(height: 22),
          Center(child: Wrap(alignment: WrapAlignment.center, children: [
            const Text('Already have an account? ', style: TextStyle(color: AppColors.gray, fontSize: 12)),
            GestureDetector(onTap: () => context.go('/sign-in'), child: const Text('Sign In', style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.w700, fontSize: 12))),
          ])),
          const SizedBox(height: 36),
          const SkylineFooter(caption: 'BUILDING HOMEOWNERS, BUILDING FUTURES'),
        ],
      )),
    ))),
  );
}
