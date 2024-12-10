import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QM2 extends ConsumerStatefulWidget {
  const QM2({super.key});

  @override
  ConsumerState<QM2> createState() => _QM2State();
}

class _QM2State extends ConsumerState<QM2> {
  @override
  Widget build(BuildContext context) {
    // Usa il WidgetRef per accedere ai provider
    final backcolor = ref.watch(vcProvider);
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backcolor,
      appBar: const TopBar(
        title: 'MongoDB',
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

            const QueryTWM2(),

            Center(
              child: SizedBox(
                width: screenWidth * 0.98,
                height: 200,
                child: Image.asset(
                  'assets/images/QM/QM2.png', // Percorso dell'immagine
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

class QueryTWM2 extends StatelessWidget {
  const QueryTWM2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
    TextSpan(
  children: [
    _buildTextSpan('SMBUD_project.Carrer.aggregate([\n', true),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$group":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "_id": "\$Current Occupation",\n', false),
    _buildTextSpan('      "Satisfaction": { "\$avg": "\$Job Satisfaction" }\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$match":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "_id": { "\$ne": null }\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$project":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "Occupation": "\$_id",\n', false),
    _buildTextSpan('      "_id": 0,\n', false),
    _buildTextSpan('      "Satisfaction": 1\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$sort":', true),
    _buildTextSpan(' { "Satisfaction": -1 }\n', false),
    _buildTextSpan('  }\n', false),
    _buildTextSpan(']);\n', false),
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
        fontFamily: 'MyFont',
        fontSize: isBold ? 16 : 14,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
