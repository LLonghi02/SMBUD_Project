import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QN4 extends ConsumerStatefulWidget {
  const QN4({super.key});

  @override
  ConsumerState<QN4> createState() => _QN4State();
}

class _QN4State extends ConsumerState<QN4> {
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
                'Have you drank enough today?',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Trend of Beers sold over time at USA’s stores, useful to spot trendings and eventually to manage the pricing',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10), // Spaziatura tra i componenti.

            const QueryTextWidget4(),

            Center(
              child: SizedBox(
                width: screenWidth * 0.98,
                height: 200,
                child: Image.asset(
                  'assets/images/QN/QN4.png', // Percorso dell'immagine
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

class QueryTextWidget4 extends StatelessWidget {
  const QueryTextWidget4({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
 TextSpan(
          children: [
            _buildTextSpan('MATCH', true),
            _buildTextSpan(' ( store : Store { country : "USA" }) - [: IN_STORE ] - ( s : Sale ) - [ sell : LINE_ITEM ] -( beer : Product ) - [: IN_CATEGORY ] - ( beer_cat : ProductSubCategory { name :" Beer "}) ,\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' beer , day , SUM( sell . quantity ) as sold_beers\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(' day , SUM ( sold_beers ) as total_sold_beers\n'),
            _buildTextSpan('RETURN', true),
            _buildTextSpan(' day. date AS date , day . day_of_week , total_sold_beers\n'),
            _buildTextSpan('ORDER BY', true),
            _buildTextSpan(' day. day ASC\n'),
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
