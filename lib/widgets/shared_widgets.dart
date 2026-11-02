import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class ZadokLogo extends StatelessWidget {
  const ZadokLogo({super.key, this.compact = false});
  final bool compact;
  @override
  Widget build(BuildContext context) => Row(mainAxisSize: MainAxisSize.min, children: [
    SvgPicture.asset('assets/svg/zadok_mark.svg', width: compact ? 48 : 66, height: compact ? 48 : 66),
    const SizedBox(width: 10),
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('ZADOK', style: GoogleFonts.playfairDisplay(fontSize: compact ? 31 : 39, height: .95, fontWeight: FontWeight.w700, color: AppColors.maroon, letterSpacing: 1)),
      const SizedBox(height: 5),
      Row(children: [
        Container(width: 34, height: 1, color: AppColors.gold),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 9), child: Text('O N E', style: GoogleFonts.poppins(fontSize: 11, letterSpacing: 4, color: AppColors.gold, fontWeight: FontWeight.w600))),
        Container(width: 34, height: 1, color: AppColors.gold),
      ]),
    ]),
  ]);
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.label, required this.onPressed, this.loading = false});
  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  @override
  Widget build(BuildContext context) => SizedBox(width: double.infinity, height: 54, child: DecoratedBox(
    decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF9E0711), AppColors.maroonDark]), borderRadius: BorderRadius.circular(AppRadii.pill), boxShadow: [BoxShadow(color: AppColors.maroon.withOpacity(.18), blurRadius: 14, offset: const Offset(0, 6))]),
    child: ElevatedButton(onPressed: loading ? null : onPressed, style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, shape: const StadiumBorder()), child: loading ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text(label, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)), const SizedBox(width: 12), const Icon(Icons.arrow_forward, color: Colors.white)])),
  ));
}

class OutlinedPillButton extends StatelessWidget {
  const OutlinedPillButton({super.key, required this.label, required this.icon, required this.onPressed, this.iconColor});
  final String label;
  final Widget icon;
  final VoidCallback? onPressed;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) => SizedBox(width: double.infinity, height: 52, child: OutlinedButton.icon(
    onPressed: onPressed, icon: icon, label: Text(label, style: const TextStyle(color: AppColors.navy, fontWeight: FontWeight.w500)),
    style: OutlinedButton.styleFrom(backgroundColor: Colors.white, side: const BorderSide(color: AppColors.goldLight), shape: const StadiumBorder()),
  ));
}

class ZadokTextField extends StatelessWidget {
  const ZadokTextField({super.key, required this.controller, required this.hint, required this.icon, this.password = false, this.obscure = false, this.onToggle});
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool password, obscure;
  final VoidCallback? onToggle;
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(.035), blurRadius: 12, offset: const Offset(0, 4))], borderRadius: BorderRadius.circular(AppRadii.field)),
    child: TextField(controller: controller, obscureText: password && obscure, decoration: InputDecoration(
      hintText: hint, prefixIcon: Padding(padding: const EdgeInsets.all(9), child: CircleAvatar(backgroundColor: AppColors.cream, child: Icon(icon, color: AppColors.gold, size: 21))),
      suffixIcon: password ? IconButton(onPressed: onToggle, icon: Icon(obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.gray)) : null,
      contentPadding: const EdgeInsets.symmetric(vertical: 19, horizontal: 14),
    )),
  );
}

class SkylineFooter extends StatelessWidget {
  const SkylineFooter({super.key, this.caption});
  final String? caption;
  @override
  Widget build(BuildContext context) => Column(children: [
    SizedBox(height: 76, width: double.infinity, child: SvgPicture.asset('assets/svg/skyline.svg', fit: BoxFit.fill)),
    if (caption != null) Padding(padding: const EdgeInsets.only(top: 7, bottom: 4), child: Text(caption!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 9, letterSpacing: 3, color: AppColors.gold, fontWeight: FontWeight.w600))),
  ]);
}

class IconChip extends StatelessWidget {
  const IconChip({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) => SizedBox(width: 78, child: Column(children: [
    Container(width: 58, height: 58, decoration: BoxDecoration(color: AppColors.cream, borderRadius: BorderRadius.circular(14)), child: Icon(icon, color: AppColors.maroon, size: 29)),
    const SizedBox(height: 8), Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, height: 1.3, color: AppColors.navy)),
  ]));
}
