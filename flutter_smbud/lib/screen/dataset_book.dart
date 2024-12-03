import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class DSBook extends ConsumerStatefulWidget {
  const DSBook({Key? key}) : super(key: key);

  @override
  ConsumerState<DSBook> createState() => _DSBookState();
}

class _DSBookState extends ConsumerState<DSBook> {
  @override
  Widget build(BuildContext context) {
    // Usa il WidgetRef per accedere ai provider
    final backcolor = ref.watch(
        vcProvider); 
    // Calcolare la larghezza dello schermo e prenderne il 75%
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
                'Books Dataset',
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
                  'assets/images/dataset/bookDS.png', // Percorso dell'immagine
                  fit: BoxFit
                      .contain, // Usa BoxFit.contain per evitare che l'immagine venga tagliata
                ),
              ),
            ),
            const SizedBox(height: 12), // Spaziatura tra i componenti.

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Users Dataset',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              // Aggiungi Center per allineare l'immagine al centro
              child: SizedBox(
                width:
                    imageWidth, // Imposta la larghezza dell'immagine al 75% dello schermo
                height: 80,
                child: Image.asset(
                  'assets/images/dataset/userDS.png', // Percorso dell'immagine
                  fit: BoxFit
                      .contain, // Usa BoxFit.contain per evitare che l'immagine venga tagliata
                ),
              ),
            ),

            const SizedBox(height: 12), // Spaziatura tra i componenti.

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Ratings Dataset',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              // Aggiungi Center per allineare l'immagine al centro
              child: SizedBox(
                width:
                    imageWidth, // Imposta la larghezza dell'immagine al 75% dello schermo
                height: 80,
                child: Image.asset(
                  'assets/images/dataset/ratDS.png', // Percorso dell'immagine
                  fit: BoxFit
                      .contain, // Usa BoxFit.contain per evitare che l'immagine venga tagliata
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomBar(), // Assicurati che BottomBar sia definito correttamente
    );
  }
}
