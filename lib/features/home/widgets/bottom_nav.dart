import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class DashboardBottomNav extends StatelessWidget {
  const DashboardBottomNav({super.key});
  @override Widget build(BuildContext context) => Container(padding: const EdgeInsets.fromLTRB(8, 9, 8, 7), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [BoxShadow(color: Colors.black.withOpacity(.07), blurRadius: 16, offset: const Offset(0, -2))]), child: Row(children: [
    _NavItem(icon: Icons.home, label: 'Home', active: true, onTap: () {}),
    _NavItem(icon: Icons.account_balance_wallet_outlined, label: 'Wallet', onTap: () {}),
    _NavItem(icon: Icons.explore_outlined, label: 'Explore', onTap: () {}),
    _NavItem(icon: Icons.chat_bubble_outline, label: 'Messages', badge: '2', onTap: () {}),
    _NavItem(icon: Icons.person_outline, label: 'Profile', onTap: () {}),
  ]));
}
class _NavItem extends StatelessWidget {
  const _NavItem({required this.icon, required this.label, required this.onTap, this.active = false, this.badge});
  final IconData icon; final String label; final bool active; final String? badge; final VoidCallback onTap;
  @override Widget build(BuildContext context) => Expanded(child: InkWell(onTap: onTap, child: Column(mainAxisSize: MainAxisSize.min, children: [
    Stack(clipBehavior: Clip.none, children: [Icon(icon, size: 23, color: active ? AppColors.maroon : AppColors.gray), if (badge != null) Positioned(right: -9, top: -7, child: Container(width: 17, height: 17, decoration: const BoxDecoration(color: AppColors.maroon, shape: BoxShape.circle), child: Center(child: Text(badge!, style: const TextStyle(color: Colors.white, fontSize: 9))))) ]),
    const SizedBox(height: 4), Text(label, style: TextStyle(fontSize: 9, color: active ? AppColors.maroon : AppColors.gray, fontWeight: active ? FontWeight.w600 : FontWeight.normal)),
  ])));
}
