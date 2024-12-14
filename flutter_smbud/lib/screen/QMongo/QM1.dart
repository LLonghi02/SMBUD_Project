import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QM1 extends ConsumerStatefulWidget {
  const QM1({super.key});

  @override
  ConsumerState<QM1> createState() => _QM1State();
}

class _QM1State extends ConsumerState<QM1> {
  @override
  Widget build(BuildContext context) {
    // Usa il WidgetRef per accedere ai provider
    final backcolor = ref.watch(vcProvider);

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
                'Satisfaction',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Compute the Satisfaction index (average of each Job Satisfaction) for each job, then rank them',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10), // Spaziatura tra i componenti.

            QueryTWM1(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Output',
                style: AppFonts
                    .textBold2, // Assicurati che AppFonts.textRegular sia definito
              ),
            ),
            SizedBox(height: 10),
            OutputTWM1(),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomBar(), // Assicurati che BottomBar sia definito correttamente
    );
  }
}

class OutputTWM1 extends StatelessWidget {
  const OutputTWM1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
        TextSpan(
          children: [
            _buildTextSpan('[\n', false),
            _buildTextSpan('  {\n', false),
            _buildTextSpan('    "Satisfaction":', true),
            _buildTextSpan(' 5.558755464129597,\n', false),
            _buildTextSpan('    "Occupation":', true),
            _buildTextSpan(' "Psychologist"\n', false),
            _buildTextSpan('  },\n', false),
            _buildTextSpan('  {\n', false),
            _buildTextSpan('    "Satisfaction":', true),
            _buildTextSpan(' 5.556703762586116,\n', false),
            _buildTextSpan('    "Occupation":', true),
            _buildTextSpan(' "Biologist"\n', false),
            _buildTextSpan('  },\n', false),
            _buildTextSpan('  {\n', false),
            _buildTextSpan('    "Satisfaction":', true),
            _buildTextSpan(' 5.486328643482878,\n', false),
            _buildTextSpan('    "Occupation":', true),
            _buildTextSpan(' "Economist"\n', false),
            _buildTextSpan('  },\n', false),
            _buildTextSpan('  {\n', false),
            _buildTextSpan('    "Satisfaction":', true),
            _buildTextSpan(' 5.486003110419906,\n', false),
            _buildTextSpan('    "Occupation":', true),
            _buildTextSpan(' "Business Analyst"\n', false),
            _buildTextSpan('  },\n', false),
            _buildTextSpan('  {\n', false),
            _buildTextSpan('    "Satisfaction":', true),
            _buildTextSpan(' 5.483205501190161,\n', false),
            _buildTextSpan('    "Occupation":', true),
            _buildTextSpan(' "Lawyer"\n', false),
            _buildTextSpan('  },\n', false),
            _buildTextSpan('  {\n', false),
            _buildTextSpan('    "Satisfaction":', true),
            _buildTextSpan(' 5.473792394655704,\n', false),
            _buildTextSpan('    "Occupation":', true),
            _buildTextSpan(' "Software Developer"\n', false),
            _buildTextSpan('  },\n', false),
            _buildTextSpan('  {\n', false),
            _buildTextSpan('    "Satisfaction":', true),
            _buildTextSpan(' 5.4702396289616075,\n', false),
            _buildTextSpan('    "Occupation":', true),
            _buildTextSpan(' "Artist"\n', false),
            _buildTextSpan('  },\n', false),
            _buildTextSpan('  {\n', false),
            _buildTextSpan('    "Satisfaction":', true),
            _buildTextSpan(' 5.465002573340196,\n', false),
            _buildTextSpan('    "Occupation":', true),
            _buildTextSpan(' "Teacher"\n', false),
            _buildTextSpan('  },\n', false),
            _buildTextSpan('  {\n', false),
            _buildTextSpan('    "Satisfaction":', true),
            _buildTextSpan(' 5.46023166023166,\n', false),
            _buildTextSpan('    "Occupation":', true),
            _buildTextSpan(' "Doctor"\n', false),
            _buildTextSpan('  },\n', false),
            _buildTextSpan('  {\n', false),
            _buildTextSpan('    "Satisfaction":', true),
            _buildTextSpan(' 5.452835118892082,\n', false),
            _buildTextSpan('    "Occupation":', true),
            _buildTextSpan(' "Mechanical Engineer"\n', false),
            _buildTextSpan('  }\n', false),
            _buildTextSpan(']\n', false),
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

class QueryTWM1 extends StatelessWidget {
  const QueryTWM1({super.key});

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
            _buildTextSpan(
                '      "Satisfaction": { "\$avg": "\$Job Satisfaction" }\n',
                false),
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
