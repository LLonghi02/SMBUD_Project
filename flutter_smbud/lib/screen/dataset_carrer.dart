
import 'package:flutter_smbud/importer.dart'; 

class DSCarrer extends ConsumerStatefulWidget {
  const DSCarrer({Key? key}) : super(key: key);

  @override
  ConsumerState<DSCarrer> createState() => _DSCarrerState();
}

class _DSCarrerState extends ConsumerState<DSCarrer> {
  @override
  Widget build(BuildContext context) {
    final backcolor = Colors.white;
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth * 0.90;

    return Scaffold(
      backgroundColor: backcolor,
      appBar: const TopBar(
        title: 'MongoDB: Dataset',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 18), // Spaziatura tra i componenti.

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Carrer and change prediction Dataset',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              // Aggiungi Center per allineare l'immagine al centro
              child: SizedBox(
                width:imageWidth, // Imposta la larghezza dell'immagine al 75% dello schermo
                height: 80,
                child: Image.asset(
                  'assets/images/dataset/carrer.png', // Percorso dell'immagine
                  fit: BoxFit
                      .contain, // Usa BoxFit.contain per evitare che l'immagine venga tagliata
                ),
              ),
            ),
            const SizedBox(height: 12), // Spaziatura tra i componenti.

          ],
        ),
      ),
      bottomNavigationBar:
          const BottomBar(), // Assicurati che BottomBar sia definito correttamente
    );
  }
}
