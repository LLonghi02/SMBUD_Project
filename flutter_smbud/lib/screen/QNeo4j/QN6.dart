import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QN6 extends ConsumerStatefulWidget {
  const QN6({super.key});

  @override
  ConsumerState<QN6> createState() => _QN6State();
}

class _QN6State extends ConsumerState<QN6> {
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
                'Top Stores',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Find the top 5 stores that earned more',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10), // Spaziatura tra i componenti.

            const QueryTextWidget6(),

            Center(
              child: SizedBox(
                width: screenWidth * 0.98,
                height: 100,
                child: Image.asset(
                  'assets/images/QN/QN6.png', // Percorso dell'immagine
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

class QueryTextWidget6 extends StatelessWidget {
  const QueryTextWidget6({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text.rich(
TextSpan(
  children: [
    _buildTextSpan('MATCH', true),
    _buildTextSpan(' (s: Store ) <-[: IN_STORE ]-( sa: Sale ) -[l: LINE_ITEM ]->(: Product )\n'),
    _buildTextSpan('WITH', true),
    _buildTextSpan(' s, sum(l.price * l.quantity) / 10000 AS sales\n'),
    _buildTextSpan('ORDER BY', true),
    _buildTextSpan(' sales DESC\n'),
    _buildTextSpan('RETURN', true),
    _buildTextSpan(' s.name, sales LIMIT 5\n'),
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
