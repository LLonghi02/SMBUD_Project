
import 'package:flutter_smbud/importer.dart'; 

class QN2 extends ConsumerStatefulWidget {
  const QN2({super.key});

  @override
  ConsumerState<QN2> createState() => _QN2State();
}

class _QN2State extends ConsumerState<QN2> {
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
                'Unforgettable day',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Retrieve the most profitable day for each store',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10), // Spaziatura tra i componenti.

            const QueryTextWidget2(),

            Center(
              child: SizedBox(
                width: screenWidth * 0.99,
                height: 300,
                child: Image.asset(
                  'assets/images/QN/QN2.png', // Percorso dell'immagine
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

class QueryTextWidget2 extends StatelessWidget {
  const QueryTextWidget2({super.key});

  @override
   Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text.rich(
        TextSpan(
          children: [
            _buildTextSpan('MATCH', true),
            _buildTextSpan(' ( store : Store ) - [: IN_STORE ] - (s: Sale ) -[ purchase : LINE_ITEM ] - (: Product )\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' store , s , SUM( toFloat ( purchase . price - purchase . cost_price ) /10000 * purchase . quantity ) AS total_sale_profit\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' store , s, round ( total_sale_profit * 100) / 100 AS rounded_total_sale_profit\n'),
            _buildTextSpan('MATCH', true),
            _buildTextSpan(' (s: Sale ) - [: ON_DATE ] - (day: Date )\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' store , day , SUM( rounded_total_sale_profit ) AS total_profit_day\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' store , day , round ( total_profit_day * 100) / 100 AS rounded_total_profit_day\n'),
            _buildTextSpan('ORDER BY', true),
            _buildTextSpan(' rounded_total_profit_day DESC\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' store , collect ({ day: day , total : rounded_total_profit_day })[0] AS top_day_profit\n'),
            _buildTextSpan('RETURN', true),
            _buildTextSpan(' store .name , top_day_profit .day. date AS day , top_day_profit .total AS max_total_per_day\n'),
            _buildTextSpan('ORDER BY', true),
            _buildTextSpan(' store ASC\n'),
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
