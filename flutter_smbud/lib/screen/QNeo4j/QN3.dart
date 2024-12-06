import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QN3 extends ConsumerStatefulWidget {
  const QN3({super.key});

  @override
  ConsumerState<QN3> createState() => _QN3State();
}

class _QN3State extends ConsumerState<QN3> {
  @override
  Widget build(BuildContext context) {
    // Usa il WidgetRef per accedere ai provider
    final backcolor = ref.watch(vcProvider);
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backcolor,
      appBar: const TopBar(
        title: 'Neo4j',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 18), // Spaziatura tra i componenti.

            // Titolo
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'What’s popular in Acapulco?',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Retrieve the 10 most popular couple of sold item in a sale at Acapulco’s stores, useful in order of starting new promotions',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10), // Spaziatura tra i componenti.

            const QueryTextWidget3(),

            Center(
              child: SizedBox(
                width: screenWidth,
                height: 500,
                child: Image.asset(
                  'assets/images/QN/QN3.png', // Percorso dell'immagine
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

class QueryTextWidget3 extends StatelessWidget {
  const QueryTextWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
         TextSpan(
          children: [
            _buildTextSpan('MATCH', true),
            _buildTextSpan(' ( store : Store { city :" Acapulco "}) - [: IN_STORE ] - (s: Sale ) , ( p1: Product ) - [: LINE_ITEM ] - (s: Sale ) - [: LINE_ITEM ] - (p2: Product )\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' p1 , p2\n'),
            _buildTextSpan('WHERE', true),
            _buildTextSpan(' id(p1) < id(p2)\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' p1 , p2 , COUNT (*) AS pair_count\n'),
            _buildTextSpan('RETURN', true),
            _buildTextSpan(' p1 , p2 , pair_count\n'),
            _buildTextSpan('ORDER BY', true),
            _buildTextSpan(' pair_count DESC\n'),
            _buildTextSpan('LIMIT', true),
            _buildTextSpan(' 10\n'),
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  TextSpan _buildTextSpan(String text, [bool isBold = false]) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: isBold ? 18 : 16,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
