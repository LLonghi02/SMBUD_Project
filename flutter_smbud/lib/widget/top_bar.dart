import 'package:flutter_smbud/importer.dart';

class TopBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title; // Nuovo parametro

  const TopBar({required this.title, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accentColor = ref.watch(barColorProvider);

    return AppBar(
      backgroundColor: accentColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title, // Usa il titolo dinamico
            style: AppFonts.appTitle,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
