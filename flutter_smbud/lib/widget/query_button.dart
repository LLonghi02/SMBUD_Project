import 'package:flutter_smbud/importer.dart';

class TextWithButtonCard extends StatelessWidget {
  final String text; // Testo visualizzato a sinistra
  final VoidCallback onPressed; // Azione eseguita quando si preme il pulsante
  final Color buttonColor; // Colore del pulsante (opzionale)

  const TextWithButtonCard({
    required this.text,
    required this.onPressed,
    this.buttonColor = Colors.blue, // Colore predefinito
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                style:AppFonts.textQ,
              ),
            ),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Execute'),
            ),
          ],
        ),
      ),
    );
  }
}
