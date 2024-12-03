import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart';

class TopBar extends ConsumerWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accentColor = ref.watch(barColorProvider);

    return AppBar(
      backgroundColor: accentColor,
      automaticallyImplyLeading: false, // Disabilita la freccia di ritorno automatica
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Allineamento a sinistra
        crossAxisAlignment: CrossAxisAlignment.center, // Centra verticalmente
        children: [
          SizedBox(
            width: 60, // Larghezza personalizzata
            height: 60, // Altezza personalizzata
            child: Image.asset(
              'assets/images/logo.png', // Percorso dell'immagine
              fit: BoxFit.contain, // Adatta l'immagine senza tagliarla
            ),
          ),
          const SizedBox(width: 8), // Spazio tra immagine e testo
          const Text(
            'Group 49',
            style: AppFonts.appTitle,
          ),
          const Spacer(), // Spinge gli altri widget a destra
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
