import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});
  static const items = [(Icons.savings_outlined, 'Save'), (Icons.trending_up, 'Invest'), (Icons.school_outlined, 'Learn'), (Icons.home_outlined, 'Properties'), (Icons.account_balance_wallet_outlined, 'Wallet'), (Icons.apps, 'Zadok Life\n(Ecosystem)')];
  @override Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const _SectionHeading('Quick Actions', trailing: 'See All'), const SizedBox(height: 12),
    SizedBox(height: 104, child: ListView.separated(scrollDirection: Axis.horizontal, itemCount: items.length, separatorBuilder: (_, __) => const SizedBox(width: 9), itemBuilder: (context, i) {
      final item = items[i]; return Container(width: 82, padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5), decoration: BoxDecoration(color: Colors.white, border: Border.all(color: i == 5 ? AppColors.maroon : const Color(0xFFF0F0F0)), borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withOpacity(.025), blurRadius: 8)]), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(item.$1, color: AppColors.maroon, size: 27), const SizedBox(height: 7), Text(item.$2, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, height: 1.2, color: AppColors.navy))]));
    })),
  ]);
}
class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});
  @override Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(17), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17), boxShadow: [BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 12, offset: const Offset(0, 3))]), child: Column(children: [
    Row(children: [
      const _RingProgress(), const SizedBox(width: 18), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Homeownership\nGoal Progress', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, height: 1.5)), SizedBox(height: 7), Text('Target: ₦25,000,000', style: TextStyle(fontSize: 11, color: AppColors.gray))])), const Icon(Icons.chevron_right, color: AppColors.gray),
    ]),
    const Divider(height: 26, color: AppColors.line),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Total Savings', style: TextStyle(color: AppColors.gray, fontSize: 12)), SizedBox(height: 4), Text('₦6,250,000', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700, color: AppColors.navy))]),
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [Container(padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5), decoration: BoxDecoration(color: const Color(0xFFE7F7EC), borderRadius: BorderRadius.circular(9)), child: const Text('↑ 12.5%', style: TextStyle(color: AppColors.success, fontSize: 11, fontWeight: FontWeight.w600))), const SizedBox(height: 4), const Text('vs last month', style: TextStyle(fontSize: 9, color: AppColors.gray))]),
    ]),
    const SizedBox(height: 15),
    Row(children: [Expanded(child: SizedBox(height: 43, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: AppColors.maroon, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9))), child: const Text('+ Add Money', style: TextStyle(fontSize: 12))))), const SizedBox(width: 12), Expanded(child: SizedBox(height: 43, child: OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(foregroundColor: AppColors.maroon, side: const BorderSide(color: AppColors.gold), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9))), child: const Text('Withdraw', style: TextStyle(fontSize: 12)))))]),
  ]));
}
class _RingProgress extends StatelessWidget {
  const _RingProgress();
  @override Widget build(BuildContext context) => SizedBox(width: 92, height: 92, child: CustomPaint(painter: _RingPainter(), child: const Center(child: Text('65%', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)))));
}
class _RingPainter extends CustomPainter {
  @override void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size; final p = Paint()..style = PaintingStyle.stroke..strokeWidth = 7..strokeCap = StrokeCap.round;
    canvas.drawArc(rect.deflate(4), 0, 6.283, false, p..color = const Color(0xFFE7E7E7));
    canvas.drawArc(rect.deflate(4), -1.57, 4.084, false, p..shader = const SweepGradient(colors: [AppColors.gold, Color(0xFFE2A21A)]).createShader(rect));
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
class EverythingCard extends StatelessWidget {
  const EverythingCard({super.key});
  static const items = [(Icons.savings_outlined, 'Save for your\ndream home'), (Icons.trending_up, 'Invest in\nproperties'), (Icons.school_outlined, 'Learn and grow\nyour knowledge'), (Icons.workspace_premium_outlined, 'Track your\nZadokOne Score'), (Icons.support_agent, 'Get expert\nguidance')];
  @override Widget build(BuildContext context) => Container(padding: const EdgeInsets.fromLTRB(10, 17, 10, 14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(.035), blurRadius: 10)]), child: Column(children: [
    const Text('Everything you need, in one place.', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)), const SizedBox(height: 17),
    Row(children: [for (var i = 0; i < items.length; i++) Expanded(child: Container(padding: const EdgeInsets.symmetric(horizontal: 3), decoration: BoxDecoration(border: i == 0 ? null : const Border(left: BorderSide(color: AppColors.line))), child: Column(children: [Icon(items[i].$1, color: AppColors.gold, size: 26), const SizedBox(height: 8), Text(items[i].$2, textAlign: TextAlign.center, style: const TextStyle(fontSize: 9, height: 1.35, color: AppColors.navy))])))])
  ]));
}
class _SectionHeading extends StatelessWidget {
  const _SectionHeading(this.title, {this.trailing}); final String title; final String? trailing;
  @override Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)), if (trailing != null) Text(trailing!, style: const TextStyle(color: AppColors.gold, fontWeight: FontWeight.w600, fontSize: 12))]);
}
