import 'package:flutter_smbud/importer.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Neo4j',
      home: Neo4j(),
    );
  }
}

class Neo4j extends ConsumerWidget {
  const Neo4j({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backcolor =
        ref.watch(vcProvider); // Recupera il colore di sfondo dal provider
    final buttonColor =
        ref.watch(verdeProvider); // Recupera il colore di sfondo dal provider

    return Scaffold(
      backgroundColor: backcolor,
      appBar: const TopBar(
        title: 'Neo4j: FOODMART',
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
                'assets/images/food.jpg', // Percorso dell'immagine
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16), // Spaziatura tra i componenti.
            // Testo sotto l'immagine.
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'The project uses Neo4j to analyze foodmart data, modeling relationships between customers, products, sales, stores, and promotions. ',
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
                    /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SecondPage()),
        );*/
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

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'The queries developed aim to study the performance of the foodmart by analyzing sales trends, the effectiveness of promotions, '
                'and customer behavior, with the goal of optimizing business performance.',
                style: AppFonts.text,
                textAlign: TextAlign.center,
              ),
            ),
                        const SizedBox(height: 13), // Spaziatura tra i componenti.
                         TextWithButtonCard(
              text: 'Selling hubs',
              buttonColor: buttonColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QN1(),
                  ),
                );
              },
            ),
            const SizedBox(height: 13),

            TextWithButtonCard(
              text: 'Unforgettable day',
              buttonColor: buttonColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QN2(),
                  ),
                );
              },
            ),
            const SizedBox(height: 13),
            TextWithButtonCard(
              text: 'What’s popular in Acapulco?',
              buttonColor: buttonColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QN3(),
                  ),
                );
              },
            ),
            const SizedBox(height: 13),
            TextWithButtonCard(
              text: 'Have you drank enough today?',
              buttonColor: buttonColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QN4(),
                  ),
                );
              },
            ),
            const SizedBox(height: 13),
            TextWithButtonCard(
              text: 'Best clients',
              buttonColor: buttonColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QN5(),
                  ),
                );
              },
            ),/*
            const SizedBox(height: 13),
            TextWithButtonCard(
              text: 'Selling Hubs',
              buttonColor: buttonColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QN6(),
                  ),
                );
              },
            ),
            const SizedBox(height: 13),
            TextWithButtonCard(
              text: 'Selling Hubs',
              buttonColor: buttonColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QN7(),
                  ),
                );
              },
            ),
            const SizedBox(height: 13),
            TextWithButtonCard(
              text: 'Selling Hubs',
              buttonColor: buttonColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QN8(),
                  ),
                );
              },
            ),
            const SizedBox(height: 13),
            TextWithButtonCard(
              text: 'Selling Hubs',
              buttonColor: buttonColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QN9(),
                  ),
                );
              },
            ),
            const SizedBox(height: 13),
            TextWithButtonCard(
              text: 'Selling Hubs',
              buttonColor: buttonColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QN10(),
                  ),
                );
              },
            ),*/
           
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
