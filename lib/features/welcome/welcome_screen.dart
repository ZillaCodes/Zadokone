import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';
import '../../widgets/shared_widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(backgroundColor: AppColors.cream, body: SafeArea(child: SingleChildScrollView(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 680), child: Padding(
      padding: const EdgeInsets.fromLTRB(26, 28, 26, 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const ZadokLogo(),
        const SizedBox(height: 44),
        const Text('W E L C O M E  T O', style: TextStyle(color: AppColors.gold, fontSize: 13, letterSpacing: 2.5, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Text('Your Journey to', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: width < 390 ? 31 : 36)),
        Text('Homeownership', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: width < 390 ? 31 : 36, color: AppColors.maroon)),
        const SizedBox(height: 16),
        const Text('The all-in-one platform that helps you save, plan, find, finance and own your dream home — and beyond.', style: TextStyle(fontSize: 15, height: 1.65, color: AppColors.navy)),
        const SizedBox(height: 20),
        const _FamilyHero(),
        const SizedBox(height: 16),
        SizedBox(height: 94, child: CustomPaint(painter: _BannerPainter(), child: Padding(padding: const EdgeInsets.only(left: 28, top: 17), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('More than just a home…', style: TextStyle(fontFamily: 'cursive', fontSize: 24, fontStyle: FontStyle.italic, color: AppColors.goldLight)),
          const SizedBox(height: 4), const Text('I T ’ S   A   F U T U R E .', style: TextStyle(color: AppColors.goldLight, fontSize: 10, letterSpacing: 1.6)),
        ])))),
        const SizedBox(height: 24),
        const Wrap(alignment: WrapAlignment.spaceBetween, runSpacing: 18, children: [
          IconChip(icon: Icons.home_outlined, label: 'Own Property'),
          IconChip(icon: Icons.trending_up, label: 'Build Wealth'),
          IconChip(icon: Icons.menu_book_outlined, label: 'Grow Knowledge'),
          IconChip(icon: Icons.verified_user_outlined, label: 'Live Securely'),
          IconChip(icon: Icons.people_outline, label: 'Connect & Thrive'),
        ]),
        const SizedBox(height: 28),
        PrimaryButton(label: 'Get Started', onPressed: null),
        const SizedBox(height: 0),
        Builder(builder: (context) => PrimaryButton(label: 'Get Started', onPressed: () => context.go('/sign-in'))),
        const SizedBox(height: 18),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Flexible(child: Text('Already have an account? ', style: TextStyle(fontSize: 12))),
          GestureDetector(onTap: () => context.go('/sign-in'), child: const Text('Sign In', style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.w700, fontSize: 12))),
        ]),
        const SizedBox(height: 20),
        const SkylineFooter(),
      ]),
    ))))));
  }
}

class _FamilyHero extends StatelessWidget {
  const _FamilyHero();
  @override
  Widget build(BuildContext context) => ClipPath(clipper: _HeroClipper(), child: SizedBox(height: 250, width: double.infinity, child: Stack(fit: StackFit.expand, children: [
    const DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFF3E4CA), Color(0xFFB68B55), Color(0xFF684B35)]))),
    Positioned(right: 0, top: 12, child: Icon(Icons.apartment, size: 220, color: Colors.white.withOpacity(.34))),
    const Positioned(left: 20, bottom: 18, child: Icon(Icons.family_restroom, size: 125, color: AppColors.cream)),
    const Positioned(left: 150, bottom: 22, child: Icon(Icons.house, size: 120, color: Colors.white54)),
  ])));
}
class _HeroClipper extends CustomClipper<Path> {
  @override Path getClip(Size s) => Path()..moveTo(0, 0)..lineTo(s.width, 0)..lineTo(s.width, s.height)..quadraticBezierTo(s.width * .48, s.height * 1.08, 0, s.height * .72)..close();
  @override bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
class _BannerPainter extends CustomPainter {
  @override void paint(Canvas canvas, Size size) {
    final p = Path()..moveTo(0, 0)..lineTo(size.width * .48, size.height * .24)..lineTo(size.width * .48, size.height)..lineTo(0, size.height * .68)..close();
    canvas.drawPath(p, Paint()..color = AppColors.maroon..style = PaintingStyle.fill);
    canvas.drawPath(p, Paint()..color = AppColors.gold..style = PaintingStyle.stroke..strokeWidth = 2);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
