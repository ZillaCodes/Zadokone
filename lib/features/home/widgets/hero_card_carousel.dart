import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../theme/app_theme.dart';

class HeroCardCarousel extends StatefulWidget {
  const HeroCardCarousel({super.key});
  @override State<HeroCardCarousel> createState() => _HeroCardCarouselState();
}
class _HeroCardCarouselState extends State<HeroCardCarousel> {
  final _controller = PageController();
  final ValueNotifier<int> _page = ValueNotifier<int>(0);
  @override void dispose() { _controller.dispose(); _page.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) => Column(children: [
    SizedBox(height: 220, child: PageView(controller: _controller, onPageChanged: (i) => _page.value = i, children: const [_ScoreCard(), _HomeStartCard()])),
    const SizedBox(height: 12),
    ValueListenableBuilder<int>(valueListenable: _page, builder: (context, value, _) => AnimatedSmoothIndicator(activeIndex: value, count: 2, effect: const ExpandingDotsEffect(activeDotColor: AppColors.maroon, dotColor: Color(0xFFE5D9D5), dotHeight: 7, dotWidth: 7, expansionFactor: 3))),
  ]);
}
// Page index and dot updates live inside this StatefulWidget; swipes never call setState on HomeScreen.
class _ScoreCard extends StatelessWidget {
  const _ScoreCard();
  @override Widget build(BuildContext context) => _CardShell(colors: const [Color(0xFF9E0711), AppColors.maroonDark], child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text('ZADOKONE SCORE', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
    const SizedBox(height: 8), const Text('720', style: TextStyle(color: Colors.white, fontSize: 43, fontWeight: FontWeight.w700, height: 1)),
    const Text('Strong', style: TextStyle(color: Colors.white, fontSize: 17)),
    const SizedBox(height: 14), const _ProgressBar(value: .72),
    const SizedBox(height: 10), const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Next tier: Elite', style: TextStyle(color: Colors.white, fontSize: 11)), Text('850', style: TextStyle(color: Colors.white, fontSize: 11))]),
    const Spacer(),
  ],), badge: Icons.workspace_premium_outlined));
}
class _HomeStartCard extends StatelessWidget {
  const _HomeStartCard();
  @override Widget build(BuildContext context) => _CardShell(colors: const [Color(0xFFD69A16), Color(0xFF9B6500)], badge: Icons.home, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text('HOME START', style: TextStyle(color: Colors.white, fontSize: 12)),
    const SizedBox(height: 8), const Text('₦5,000,000', style: TextStyle(color: Colors.white, fontSize: 31, fontWeight: FontWeight.w700)),
    const Text('Your Home Start Fund', style: TextStyle(color: Colors.white, fontSize: 15)),
    const SizedBox(height: 14), const _ProgressBar(value: .5),
    const SizedBox(height: 9), const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Target: ₦10,000,000', style: TextStyle(color: Colors.white, fontSize: 10)), Text('50%', style: TextStyle(color: Colors.white, fontSize: 10))]),
    const Spacer(), SizedBox(height: 34, width: double.infinity, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.gold, shape: const StadiumBorder()), child: const Text('Apply'))),
  ]));
}
class _CardShell extends StatelessWidget {
  const _CardShell({required this.colors, required this.child, required this.badge});
  final List<Color> colors; final Widget child; final IconData badge;
  @override Widget build(BuildContext context) => Container(margin: const EdgeInsets.symmetric(horizontal: 1), padding: const EdgeInsets.all(20), decoration: BoxDecoration(gradient: LinearGradient(colors: colors), borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: colors.last.withOpacity(.2), blurRadius: 12, offset: const Offset(0, 5))]), child: Stack(children: [
    Positioned(right: -4, top: -5, child: Icon(badge, size: 75, color: AppColors.goldLight.withOpacity(.9))),
    Positioned(right: 4, bottom: 0, child: Icon(Icons.bar_chart, size: 62, color: Colors.white.withOpacity(.08))),
    child,
  ]));
}
class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.value}); final double value;
  @override Widget build(BuildContext context) => ClipRRect(borderRadius: BorderRadius.circular(20), child: LinearProgressIndicator(value: value, minHeight: 9, backgroundColor: Colors.white.withOpacity(.25), valueColor: const AlwaysStoppedAnimation(AppColors.goldLight)));
}
