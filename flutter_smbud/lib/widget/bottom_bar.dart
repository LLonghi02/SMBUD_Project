import 'package:flutter_smbud/importer.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final barColor = ref.watch(barColorProvider); // Recupera il colore di sfondo dal provider
    return Container(
      height: 70,
      width: double.infinity, // Imposta la larghezza a tutto lo schermo
      decoration: BoxDecoration(
        color: barColor, // Utilizza il colore di sfondo dal provider
        border: const Border(
          top: BorderSide(
            color: Colors.white, // Colore del bordo
            width: 2.0, // Larghezza del bordo
          ),
        ),
      ),
      padding: const EdgeInsets.only(
          top: 2.0, bottom: 8.0), // Riduci il padding verticale
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const Neo4j()),
              );
            },
            child: Image.asset(
              'assets/images/neo.png', // Percorso dell'immagine
              height: 40, // Altezza dell'immagine
              width: 40, // Larghezza dell'immagine
            ),
          ),
          GestureDetector(
            onTap: () {
              // Aggiungi la tua logica qui
            },
            child: Image.asset(
              'assets/images/mongo.png', // Percorso dell'immagine
              height: 40, // Altezza dell'immagine
              width: 40, // Larghezza dell'immagine
            ),
          ),
        ],
      ),
    );
  }
}
