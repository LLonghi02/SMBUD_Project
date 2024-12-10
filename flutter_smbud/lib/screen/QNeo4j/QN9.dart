import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QN9 extends ConsumerStatefulWidget {
  const QN9({super.key});

  @override
  ConsumerState<QN9> createState() => _QN9State();
}

class _QN9State extends ConsumerState<QN9> {
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
                'Best Customers',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'For every member card type, find the customer who spent more money, in order to reward them in future context',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10), // Spaziatura tra i componenti.

            const QueryTextWidget9(),

            Center(
              child: SizedBox(
                width: screenWidth * 0.98,
                height: 150,
                child: Image.asset(
                  'assets/images/QN/QN5.png', // Percorso dell'immagine
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

class QueryTextWidget9 extends StatelessWidget {
  const QueryTextWidget9({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
        TextSpan(
          children: [
            _buildTextSpan('MATCH', true),
            _buildTextSpan(
                ' (c: Customer ) <-[: PURCHASED_BY ]-(s: Sale ) -[l: LINE_ITEM ]->(p: Product )\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(
                ' c.fullname AS name, c.member_card AS card, sum(l.price * l.quantity) / 10000 AS rank\n'),
            _buildTextSpan('ORDER BY', true),
            _buildTextSpan(' card, rank DESC\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' card, collect([rank, name]) AS ranking\n'),
            _buildTextSpan('RETURN', true),
            _buildTextSpan(
                ' card, ranking[0][1] AS winner, ranking[0][0] AS rank\n'),
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
