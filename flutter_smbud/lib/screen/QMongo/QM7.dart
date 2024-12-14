import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QM7 extends ConsumerStatefulWidget {
  const QM7({super.key});

  @override
  ConsumerState<QM7> createState() => _QM7State();
}

class _QM7State extends ConsumerState<QM7> {
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
                'Total Certifications Analysis',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Calculates the total number of certifications within each field of study and education level',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10), // Spaziatura tra i componenti.

            QueryTWM7(),
 Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Output',
                style: AppFonts
                    .textBold2, // Assicurati che AppFonts.textRegular sia definito
              ),
            ),
            SizedBox(height: 10),
            OutputTWM7(),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomBar(), // Assicurati che BottomBar sia definito correttamente
    );
  }
}

class OutputTWM7 extends StatelessWidget {
  const OutputTWM7({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
TextSpan(
  children: [
    _buildTextSpan('[\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "totalCertifications":', true),
    _buildTextSpan(' 318,\n', false),
    _buildTextSpan('    "fieldOfStudy":', true),
    _buildTextSpan(' " Arts ",\n', false),
    _buildTextSpan('    "educationLevel":', true),
    _buildTextSpan(' "PhD"\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "totalCertifications":', true),
    _buildTextSpan(' 314,\n', false),
    _buildTextSpan('    "fieldOfStudy":', true),
    _buildTextSpan(' " Medicine ",\n', false),
    _buildTextSpan('    "educationLevel":', true),
    _buildTextSpan(' " High School "\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "totalCertifications":', true),
    _buildTextSpan(' 310,\n', false),
    _buildTextSpan('    "fieldOfStudy":', true),
    _buildTextSpan(' " Biology ",\n', false),
    _buildTextSpan('    "educationLevel":', true),
    _buildTextSpan(' " High School "\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  // ...\n', false),
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
class QueryTWM7 extends StatelessWidget {
  const QueryTWM7({super.key});

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
    _buildTextSpan('        "fieldOfStudy":', false),
    _buildTextSpan(' " \$Field of Study ",\n', false),
    _buildTextSpan('        "educationLevel":', false),
    _buildTextSpan(' " \$Education Level "\n', false),
    _buildTextSpan('      },\n', false),
    _buildTextSpan('      "totalCertifications":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "\$sum":', false),
    _buildTextSpan(' " \$Certifications "\n', false),
    _buildTextSpan('      }\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$project":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "fieldOfStudy":', false),
    _buildTextSpan(' " \$_id . fieldOfStudy ",\n', false),
    _buildTextSpan('      "educationLevel":', false),
    _buildTextSpan(' " \$_id . educationLevel ",\n', false),
    _buildTextSpan('      "totalCertifications":', false),
    _buildTextSpan(' 1,\n', false),
    _buildTextSpan('      "_id":', false),
    _buildTextSpan(' 0\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$sort":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "totalCertifications":', false),
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
