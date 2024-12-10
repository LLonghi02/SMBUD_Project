import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QN7 extends ConsumerStatefulWidget {
  const QN7({super.key});

  @override
  ConsumerState<QN7> createState() => _QN7State();
}

class _QN7State extends ConsumerState<QN7> {
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
                'Cutting Time',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Find, for each store, which department made less money, that’s usefull in order to design new promotion for that store',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10), // Spaziatura tra i componenti.

            const QueryTextWidget7(),

            Center(
              child: SizedBox(
                width: screenWidth * 0.98,
                height: 400,
                child: Image.asset(
                  'assets/images/QN/QN7.png', // Percorso dell'immagine
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

class QueryTextWidget7 extends StatelessWidget {
  const QueryTextWidget7({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
        TextSpan(
          children: [
            _buildTextSpan('MATCH', true),
            _buildTextSpan(
                ' (st: Store ) <-[: IN_STORE ]-( sa: Sale ) -[l: LINE_ITEM ]->(pr: Product ) -[: IN_CATEGORY ]->(sc: ProductSubCategory ) -[: IN_DEPARTMENT ]->( dep: Department )\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(
                ' st, dep, sum(l.price * l.quantity) / 10000 AS sales\n'),
            _buildTextSpan('ORDER BY', true),
            _buildTextSpan(' st.name ASC, sales ASC\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' st, collect([dep, sales]) AS dep_sales\n'),
            _buildTextSpan('RETURN', true),
            _buildTextSpan(
                ' st.name, dep_sales[0][0].name AS department, dep_sales[0][1] AS profit\n'),
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
