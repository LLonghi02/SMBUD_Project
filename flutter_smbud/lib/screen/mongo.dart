import 'package:flutter_smbud/importer.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mongo',
      home: Mongo(),
    );
  }
}

class Mongo extends ConsumerWidget {
  const Mongo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backcolor =
        ref.watch(vcProvider); // Recupera il colore di sfondo dal provider
    final buttonColor =
        ref.watch(verdeProvider); // Recupera il colore di sfondo dal provider

    return Scaffold(
      backgroundColor: backcolor,
      appBar: const TopBar(
        title: 'MongoDB: CARRER',
      ),
      body: SingleChildScrollView(
        // Rende il contenuto scrollabile.
        child: Column(
          children: [
            // Immagine larga tutto lo schermo e alta 150.
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Image.asset(
                'assets/images/work.png', // Percorso dell'immagine
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16), // Spaziatura tra i componenti.
            // Testo sotto l'immagine.
           const Padding(
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  child: Text(
    "This dataset contains detailed information about individuals' professional and educational profiles, providing insights into various factors that influence their careers, preferences, and opportunities. Each field captures a specific aspect of an individual’s professional journey, ranging from academic background to career satisfaction, allowing for comprehensive analysis of workforce trends and behaviors.",
    style: AppFonts.text,
    textAlign: TextAlign.center,
  ),
),

            const SizedBox(height: 13), // Spaziatura tra i componenti.
            // Pulsante largo tutto lo schermo.
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Padding rispetto ai bordi dello schermo.
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigazione verso un'altra pagina o altra azione.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const DSCarrer()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        buttonColor, // Colore di sfondo del bottone.
                    foregroundColor: Colors.white, // Colore del testo.
                    padding: const EdgeInsets.symmetric(
                        vertical: 16), // Spazio interno al bottone.
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Angoli arrotondati.
                    ),
                  ),
                  child: const Text('Dump del dataset', style: AppFonts.button),
                ),
              ),
            ),
            const SizedBox(height: 13), // Spaziatura tra i componenti.

            TextWithButtonCard(
              text: 'Study customer behavior based on past purchases.',
              buttonColor: buttonColor,
              onPressed: () {
                /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnotherPage(),
                  ),
                );*/
              },
            ),
            const SizedBox(height: 13),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
