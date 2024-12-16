import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QN1 extends ConsumerStatefulWidget {
  const QN1({super.key});

  @override
  ConsumerState<QN1> createState() => _QN1State();
}

class _QN1State extends ConsumerState<QN1> {
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
                'Selling Hubs',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Retrieve the cities with most sold units from their stores.Useful to track where to deliver most of items, and detect potential warehouses position',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10), // Spaziatura tra i componenti.

            const QueryTextWidget(),

            Center(
              child: SizedBox(
                width: screenWidth * 0.98,
                height: 200,
                child: Image.asset(
                  'assets/images/QN/QN1.png', // Percorso dell'immagine
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

class QueryTextWidget extends StatelessWidget {
  const QueryTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
        TextSpan(
          children: [
            _buildTextSpan('MATCH', true),
            _buildTextSpan(
                ' ( store : Store ) - [: IN_CITY ] - ( citta : City )\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' citta\n'),
            _buildTextSpan('MATCH', true),
            _buildTextSpan(
                ' ( citta : City ) - [ : IN_CITY ] - (: Store ) - [: IN_STORE ] - (s: Sale ) -[ purchase : LINE_ITEM ] - (: Product )\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(
                ' citta , s , SUM( toInteger ( purchase . quantity ) ) AS total_units\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' citta , SUM( total_units ) AS unit_per_city\n'),
            _buildTextSpan('RETURN', true),
            _buildTextSpan(' citta , unit_per_city\n'),
            _buildTextSpan('ORDER BY', true),
            _buildTextSpan(' unit_per_city DESC\n'),
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
