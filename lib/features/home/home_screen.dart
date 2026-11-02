import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'widgets/hero_card_carousel.dart';
import 'widgets/dashboard_sections.dart';
import 'widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.surface,
    body: SafeArea(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 680), child: CustomScrollView(slivers: [
      SliverPadding(padding: const EdgeInsets.fromLTRB(22, 18, 22, 110), sliver: SliverList(delegate: SliverChildListDelegate([
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Good morning,', style: TextStyle(fontSize: 13)), Text('Olumide 👋', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, height: 1.3))]),
          Stack(children: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, size: 28)), Positioned(right: 5, top: 5, child: Container(width: 16, height: 16, decoration: const BoxDecoration(color: AppColors.maroon, shape: BoxShape.circle), child: const Center(child: Text('1', style: TextStyle(color: Colors.white, fontSize: 9)))))])
        ]),
        const SizedBox(height: 17),
        const RepaintBoundary(child: HeroCardCarousel()),
        const SizedBox(height: 27),
        const QuickActions(),
        const SizedBox(height: 27),
        const Text('My Progress', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        const ProgressCard(),
        const SizedBox(height: 18),
        const EverythingCard(),
      ]))),
    ])))),
    bottomNavigationBar: SafeArea(top: false, child: Padding(padding: const EdgeInsets.fromLTRB(12, 0, 12, 8), child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 680), child: const DashboardBottomNav())))),
  );
}
