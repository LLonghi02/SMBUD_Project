import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QM3 extends ConsumerStatefulWidget {
  const QM3({super.key});

  @override
  ConsumerState<QM3> createState() => _QM3State();
}

class _QM3State extends ConsumerState<QM3> {
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
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 18), // Spaziatura tra i componenti.

            // Titolo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'changeOccupation',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'For each job, find how many people would like to change carrer path and how many would not',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10), // Spaziatura tra i componenti.

            QueryTWM3(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Output - Partial',
                style: AppFonts
                    .textBold2, // Assicurati che AppFonts.textRegular sia definito
              ),
            ),
            SizedBox(height: 10),
            OutputTWM3(),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomBar(), // Assicurati che BottomBar sia definito correttamente
    );
  }
}

class OutputTWM3 extends StatelessWidget {
  const OutputTWM3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
TextSpan(
  children: [
    _buildTextSpan('{', false),
    _buildTextSpan('"change":', true),
    _buildTextSpan(' 2161,\n', false),
    _buildTextSpan('"not_change":', true),
    _buildTextSpan(' 1606,\n', false),
    _buildTextSpan('"Occupation":', true),
    _buildTextSpan(' "Economist"\n', false),
    _buildTextSpan('},\n', false),
    _buildTextSpan('{', false),
    _buildTextSpan('"change":', true),
    _buildTextSpan(' 2275,\n', false),
    _buildTextSpan('"not_change":', true),
    _buildTextSpan(' 1610,\n', false),
    _buildTextSpan('"Occupation":', true),
    _buildTextSpan(' "Doctor"\n', false),
    _buildTextSpan('},\n', false),
    _buildTextSpan('{', false),
    _buildTextSpan('"change":', true),
    _buildTextSpan(' 0,\n', false),
    _buildTextSpan('"not_change":', true),
    _buildTextSpan(' 0,\n', false),
    _buildTextSpan('"Occupation":', true),
    _buildTextSpan(' null\n', false),
    _buildTextSpan('},\n', false),
    _buildTextSpan('{', false),
    _buildTextSpan('"change":', true),
    _buildTextSpan(' 2213,\n', false),
    _buildTextSpan('"not_change":', true),
    _buildTextSpan(' 1676,\n', false),
    _buildTextSpan('"Occupation":', true),
    _buildTextSpan(' "Psychologist"\n', false),
    _buildTextSpan('},\n', false),
    _buildTextSpan('{', false),
    _buildTextSpan('"change":', true),
    _buildTextSpan(' 2212,\n', false),
    _buildTextSpan('"not_change":', true),
    _buildTextSpan(' 1680,\n', false),
    _buildTextSpan('"Occupation":', true),
    _buildTextSpan(' "Software Developer"\n', false),
    _buildTextSpan('},\n', false),
    _buildTextSpan('{', false),
    _buildTextSpan('"change":', true),
    _buildTextSpan(' 2232,\n', false),
    _buildTextSpan('"not_change":', true),
    _buildTextSpan(' 1654,\n', false),
    _buildTextSpan('"Occupation":', true),
    _buildTextSpan(' "Teacher"\n', false),
    _buildTextSpan('},\n', false),
    _buildTextSpan('{', false),
    _buildTextSpan('"change":', true),
    _buildTextSpan(' 2209,\n', false),
    _buildTextSpan('"not_change":', true),
    _buildTextSpan(' 1618,\n', false),
    _buildTextSpan('"Occupation":', true),
    _buildTextSpan(' "Mechanical Engineer"\n', false),
    _buildTextSpan('},\n', false),
    _buildTextSpan('{', false),
    _buildTextSpan('"change":', true),
    _buildTextSpan(' 2206,\n', false),
    _buildTextSpan('"not_change":', true),
    _buildTextSpan(' 1568,\n', false),
    _buildTextSpan('"Occupation":', true),
    _buildTextSpan(' "Biologist"\n', false),
    _buildTextSpan('},\n', false),
    _buildTextSpan('...\n', false),
    _buildTextSpan(']', false),
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

class QueryTWM3 extends StatelessWidget {
  const QueryTWM3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
 TextSpan(
  children: [
    _buildTextSpan('SMBUD_project . Carrer . aggregate ([\n', true),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$group":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "_id":', false),
    _buildTextSpan(' "\$Current Occupation",\n', false),
    _buildTextSpan('      "change":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "\$sum":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('          "\$cond":', false),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('            {"\$eq":', false),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('              "\$Likely to Change Occupation", 1\n', false),
    _buildTextSpan('            ]},\n', false),
    _buildTextSpan('            1, 0\n', false),
    _buildTextSpan('          ]\n', false),
    _buildTextSpan('        }\n', false),
    _buildTextSpan('      },\n', false),
    _buildTextSpan('      "not_change":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "\$sum":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('          "\$cond":', false),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('            {"\$eq":', false),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('              "\$Likely to Change Occupation", 0\n', false),
    _buildTextSpan('            ]},\n', false),
    _buildTextSpan('            1, 0\n', false),
    _buildTextSpan('          ]\n', false),
    _buildTextSpan('        }\n', false),
    _buildTextSpan('      }\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$project":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "Occupation":', false),
    _buildTextSpan(' "\$_id",\n', false),
    _buildTextSpan('      "_id":', false),
    _buildTextSpan(' 0,\n', false),
    _buildTextSpan('      "change":', false),
    _buildTextSpan(' 1,\n', false),
    _buildTextSpan('      "not_change":', false),
    _buildTextSpan(' 1\n', false),
    _buildTextSpan('    }\n', false),
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
