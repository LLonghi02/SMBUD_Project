import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QN10 extends ConsumerStatefulWidget {
  const QN10({super.key});

  @override
  ConsumerState<QN10> createState() => _QN10State();
}

class _QN10State extends ConsumerState<QN10> {
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
                'How Many Customers',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Find how many customers each type of store has',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10), // Spaziatura tra i componenti.

            const QueryTextWidget10(),

            Center(
              child: SizedBox(
                width: screenWidth * 0.98,
                height: 110,
                child: Image.asset(
                  'assets/images/QN/QN10.png', // Percorso dell'immagine
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

class QueryTextWidget10 extends StatelessWidget {
  const QueryTextWidget10({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
        TextSpan(
          children: [
            _buildTextSpan('MATCH', true),
            _buildTextSpan(
                ' (c: Customer ) <-[: PURCHASED_BY ]-( sa: Sale ) -[: IN_STORE ]->(s: Store ) -[: OF_TYPE ]->(st: StoreType )\n'),
            _buildTextSpan('WITH', true),
            _buildTextSpan(
                ' st.name AS name, COUNT(DISTINCT c) AS customers\n'),
            _buildTextSpan('ORDER BY', true),
            _buildTextSpan(' customers\n'),
            _buildTextSpan('RETURN', true),
            _buildTextSpan(' name, customers\n'),
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
