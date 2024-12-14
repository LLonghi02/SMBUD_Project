import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QM6 extends ConsumerStatefulWidget {
  const QM6({super.key});

  @override
  ConsumerState<QM6> createState() => _QM6State();
}

class _QM6State extends ConsumerState<QM6> {
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
                'Relation between experience and job opportunities',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Analyse the relationship between years of experience and job opportunities, ranking them by highest average opportunity',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10), // Spaziatura tra i componenti.

            QueryTWM6(),
 Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Output - Partial',
                style: AppFonts
                    .textBold2, // Assicurati che AppFonts.textRegular sia definito
              ),
            ),
            SizedBox(height: 10),
            OutputTWM5(),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomBar(), // Assicurati che BottomBar sia definito correttamente
    );
  }
}

class OutputTWM6 extends StatelessWidget {
  const OutputTWM6({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
TextSpan(
  children: [
    _buildTextSpan('[\n', true),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "avgJobOpportunities":', true),
    _buildTextSpan(' 52.05675954592363,\n', false),
    _buildTextSpan('    "yearsOfExperience":', true),
    _buildTextSpan(' 20\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "avgJobOpportunities":', true),
    _buildTextSpan(' 51.99171842650104,\n', false),
    _buildTextSpan('    "yearsOfExperience":', true),
    _buildTextSpan(' 33\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "avgJobOpportunities":', true),
    _buildTextSpan(' 51.48221757322176,\n', false),
    _buildTextSpan('    "yearsOfExperience":', true),
    _buildTextSpan(' 32\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  // ... \n', false),
    _buildTextSpan(']\n', false),
  ],
)
,

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
class QueryTWM6 extends StatelessWidget {
  const QueryTWM6({super.key});

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
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "yearsOfExperience":', false),
    _buildTextSpan(' " \$Years of Experience ",\n', false),
    _buildTextSpan('      },\n', false),
    _buildTextSpan('      "avgJobOpportunities":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "\$avg":', false),
    _buildTextSpan(' " \$Job Opportunities "\n', false),
    _buildTextSpan('      }\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$project":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "yearsOfExperience":', false),
    _buildTextSpan(' " \$_id . yearsOfExperience ",\n', false),
    _buildTextSpan('      "avgJobOpportunities":', false),
    _buildTextSpan(' 1,\n', false),
    _buildTextSpan('      "_id":', false),
    _buildTextSpan(' 0\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$sort":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "avgJobOpportunities":', false),
    _buildTextSpan(' -1\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  }\n', false),
    _buildTextSpan('])\n', false),
  ],
)

,

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
