import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/supabase_client.dart';
import '../../theme/app_theme.dart';
import '../../widgets/shared_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override State<SignInScreen> createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen> {
  final _identity = TextEditingController(), _password = TextEditingController();
  bool _obscure = true, _remember = true, _loading = false;
  String? _error;
  bool get _configured => Supabase.instance.isInitialized;
  Future<void> _signIn() async {
    if (!_configured) { setState(() => _error = 'Add SUPABASE_URL and SUPABASE_ANON_KEY to enable sign in.'); return; }
    if (_identity.text.trim().isEmpty || _password.text.isEmpty) { setState(() => _error = 'Enter your email and password.'); return; }
    setState(() { _loading = true; _error = null; });
    try {
      final identity = _identity.text.trim();
      if (identity.contains('@')) {
        await supabase.auth.signInWithPassword(email: identity, password: _password.text);
      } else {
        await supabase.auth.signInWithPassword(phone: identity, password: _password.text);
      }
      if (mounted) context.go('/home');
    } on AuthException catch (e) {
      if (mounted) setState(() => _error = e.message);
    } catch (_) {
      if (mounted) setState(() => _error = 'Unable to sign in. Please try again.');
    } finally { if (mounted) setState(() => _loading = false); }
  }
  @override void dispose() { _identity.dispose(); _password.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) => Scaffold(backgroundColor: AppColors.cream, body: SafeArea(child: SingleChildScrollView(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 620), child: Padding(
    padding: const EdgeInsets.fromLTRB(28, 30, 28, 10), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const ZadokLogo(), const SizedBox(height: 42),
      Text('Welcome Back', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 34)),
      const SizedBox(height: 8), const Text('Log in to your Zadok account and continue your homeownership journey.', style: TextStyle(color: AppColors.gray, fontSize: 15, height: 1.6)),
      const SizedBox(height: 30),
      ZadokTextField(controller: _identity, hint: 'Email or Phone Number', icon: Icons.mail_outline),
      const SizedBox(height: 18),
      ZadokTextField(controller: _password, hint: 'Password', icon: Icons.lock_outline, password: true, obscure: _obscure, onToggle: () => setState(() => _obscure = !_obscure)),
      const SizedBox(height: 14),
      Row(children: [
        Checkbox(value: _remember, activeColor: AppColors.gold, onChanged: (v) => setState(() => _remember = v ?? true)),
        const Expanded(child: Text('Keep me signed in', style: TextStyle(fontSize: 13))),
        TextButton(onPressed: () async {
          if (_identity.text.trim().isEmpty) { setState(() => _error = 'Enter your email first to receive a reset link.'); return; }
          try { await supabase.auth.resetPasswordForEmail(_identity.text.trim()); if (mounted) setState(() => _error = 'Password reset email sent.'); } catch (_) { if (mounted) setState(() => _error = 'Could not send the reset email.'); }
        }, child: const Text('Forgot password?', style: TextStyle(color: AppColors.gold, fontSize: 12))),
      ]),
      if (_error != null) Padding(padding: const EdgeInsets.only(bottom: 12), child: Text(_error!, style: const TextStyle(color: AppColors.maroon, fontSize: 12))),
      PrimaryButton(label: 'Sign In', loading: _loading, onPressed: _signIn),
      const SizedBox(height: 24),
      const Row(children: [Expanded(child: Divider(color: AppColors.line)), Padding(padding: EdgeInsets.symmetric(horizontal: 18), child: Text('OR', style: TextStyle(color: AppColors.gray))), Expanded(child: Divider(color: AppColors.line))]),
      const SizedBox(height: 18),
      OutlinedPillButton(label: 'Continue with Google', icon: const Text('G', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF4285F4))), onPressed: () => _oauth(OAuthProvider.google)),
      const SizedBox(height: 14),
      OutlinedPillButton(label: 'Continue with Apple', icon: const Icon(Icons.apple, color: Colors.black, size: 23), onPressed: () => _oauth(OAuthProvider.apple)),
      const SizedBox(height: 24),
      Center(child: Wrap(alignment: WrapAlignment.center, children: [const Text('Don’t have an account? ', style: TextStyle(fontSize: 12, color: AppColors.gray)), GestureDetector(onTap: () => context.go('/sign-up'), child: const Text('Create an account', style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.w600, fontSize: 12)))])),
      const SizedBox(height: 28), const SkylineFooter(caption: 'BUILDING HOMEOWNERS, BUILDING FUTURES'),
    ]),
  ))))));
  Future<void> _oauth(OAuthProvider provider) async {
    if (!_configured) { setState(() => _error = 'Configure Supabase to enable social sign in.'); return; }
    try { await supabase.auth.signInWithOAuth(provider, redirectTo: Uri.base.origin); }
    catch (_) { if (mounted) setState(() => _error = 'Social sign in could not be started.'); }
  }
}
