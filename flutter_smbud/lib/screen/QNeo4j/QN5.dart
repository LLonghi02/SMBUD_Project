import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QN5 extends ConsumerStatefulWidget {
  const QN5({super.key});

  @override
  ConsumerState<QN5> createState() => _QN5State();
}

class _QN5State extends ConsumerState<QN5> {
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
                'Best clients',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'For each year the top 3 customers who spent more. Fidelity is the most valuable trait of our clients, so let’s find who reward',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10), // Spaziatura tra i componenti.

            const QueryTextWidget5(),

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

class QueryTextWidget5 extends StatelessWidget {
  const QueryTextWidget5({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
               TextSpan(
          children: [
            _buildTextSpan('MATCH', true),
            _buildTextSpan(' ( customer : Customer ) - [: PURCHASED_BY ] - (s: Sale ) - [ sell : LINE_ITEM ] - (p: Product )\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' customer , s, SUM( toFloat ( sell . price ) / 10000 * sell . quantity ) AS money_spent\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' customer , s, round ( money_spent * 100) / 100 AS rounded_money_spent\n'),
            _buildTextSpan('MATCH', true),
            _buildTextSpan(' (s) - [: ON_DATE ] - (day: Date )\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' customer , substring (day.date , 0 , 4) AS year , SUM( toFloat ( rounded_money_spent ) ) AS Y_spent\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' customer , year , round ( Y_spent * 100) / 100 AS Y_spent_rounded\n'),
            _buildTextSpan('ORDER BY', true),
            _buildTextSpan(' Y_spent_rounded DESC\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' year , COLLECT ({ customer : customer . fullname , money_spent : Y_spent_rounded }) [0..3] AS customers_per_year\n'),
            _buildTextSpan('RETURN', true),
            _buildTextSpan(' year , customers_per_year\n'),
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
