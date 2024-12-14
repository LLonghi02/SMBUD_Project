import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QN8 extends ConsumerStatefulWidget {
  const QN8({super.key});

  @override
  ConsumerState<QN8> createState() => _QN8State();
}

class _QN8State extends ConsumerState<QN8> {
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
                'Promotions Effectiveness',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Find the number of purchase made with and without using a promotion, to analyse their effectiveness',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10), // Spaziatura tra i componenti.

            const QueryTextWidget8(),

            Center(
              child: SizedBox(
                width: screenWidth * 0.98,
                height: 40,
                child: Image.asset(
                  'assets/images/QN/QN8.png', // Percorso dell'immagine
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

class QueryTextWidget8 extends StatelessWidget {
  const QueryTextWidget8({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
        TextSpan(
          children: [
            _buildTextSpan('MATCH', true),
            _buildTextSpan(
                ' (s: Sale ) -[: APPLIED_PROMOTION ]->(pr: Promotion )\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(
                ' collect(s) AS cs, COUNT(DISTINCT s) AS with_promo\n'),
            _buildTextSpan('MATCH', true),
            _buildTextSpan(' (ns: Sale )\n'),
            _buildTextSpan('WHERE', true),
            _buildTextSpan(' NOT ns IN cs\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' with_promo, COUNT(DISTINCT ns) AS no_promo\n'),
            _buildTextSpan('RETURN', true),
            _buildTextSpan(' with_promo, no_promo\n'),
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
