import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QM8 extends ConsumerStatefulWidget {
  const QM8({super.key});

  @override
  ConsumerState<QM8> createState() => _QM8State();
}

class _QM8State extends ConsumerState<QM8> {
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
                'Skill gap Analysis',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'This query calculates the mean skill gap by the employee field of study, for each field of study, it also collects the cases where the skill gap is too high (greater or equal 5)',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10), // Spaziatura tra i componenti.

            QueryTWM8(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Output - partial',
                style: AppFonts
                    .textBold2, // Assicurati che AppFonts.textRegular sia definito
              ),
            ),
            SizedBox(height: 10),
            OutputTWM8(),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomBar(), // Assicurati che BottomBar sia definito correttamente
    );
  }
}

class OutputTWM8 extends StatelessWidget {
  const OutputTWM8({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
TextSpan(
  children: [
    _buildTextSpan('[\n', true),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "averageSkillGap":', true),
    _buildTextSpan(' 5.4410492157923205,\n', false),
    _buildTextSpan('    "fieldOfStudy":', true),
    _buildTextSpan(' " Psychology ",\n', false),
    _buildTextSpan('    "documents":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('      {\n', false),
    _buildTextSpan('        "docId":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('          "\$oid":', true),
    _buildTextSpan(' " 6750823 f8a036fa9e4893c1d " \n', false),
    _buildTextSpan('        },\n', false),
    _buildTextSpan('        "skillsGap":', true),
    _buildTextSpan(' 9,\n', false),
    _buildTextSpan('        "currentOccupation":', true),
    _buildTextSpan(' " Psychologist ",\n', false),
    _buildTextSpan('        "age":', true),
    _buildTextSpan(' 34,\n', false),
    _buildTextSpan('        "salary":', true),
    _buildTextSpan(' 80448\n', false),
    _buildTextSpan('      },\n', false),
    _buildTextSpan('      // ... \n', false),
    _buildTextSpan('    ],\n', false),
    _buildTextSpan('    "howMany":', true),
    _buildTextSpan(' 2175\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "averageSkillGap":', true),
    _buildTextSpan(' 5.537269569863746,\n', false),
    _buildTextSpan('    "fieldOfStudy":', true),
    _buildTextSpan(' " Economics ",\n', false),
    _buildTextSpan('    "documents":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('      {\n', false),
    _buildTextSpan('        "docId":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('          "\$oid":', true),
    _buildTextSpan(' " 6750823 e8a036fa9e4893c09 " \n', false),
    _buildTextSpan('        },\n', false),
    _buildTextSpan('        "skillsGap":', true),
    _buildTextSpan(' 10,\n', false),
    _buildTextSpan('        "currentOccupation":', true),
    _buildTextSpan(' " Business Analyst ",\n', false),
    _buildTextSpan('        "age":', true),
    _buildTextSpan(' 49,\n', false),
    _buildTextSpan('        "salary":', true),
    _buildTextSpan(' 116672\n', false),
    _buildTextSpan('      },\n', false),
    _buildTextSpan('      // ... \n', false),
    _buildTextSpan('    ],\n', false),
    _buildTextSpan('    "howMany":', true),
    _buildTextSpan(' 2294\n', false),
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

class QueryTWM8 extends StatelessWidget {
  const QueryTWM8({super.key});

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
    _buildTextSpan(' " \$Field of Study ",\n', false),
    _buildTextSpan('      "averageSkillGap":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "\$avg":', false),
    _buildTextSpan(' " \$Skills Gap "\n', false),
    _buildTextSpan('      },\n', false),
    _buildTextSpan('      "documents":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "\$push":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('          "docId":', false),
    _buildTextSpan(' " \$_id ",\n', false),
    _buildTextSpan('          "skillsGap":', false),
    _buildTextSpan(' " \$Skills Gap ",\n', false),
    _buildTextSpan('          "currentOccupation":', false),
    _buildTextSpan(' " \$Current Occupation ",\n', false),
    _buildTextSpan('          "age":', false),
    _buildTextSpan(' " \$Age ",\n', false),
    _buildTextSpan('          "salary":', false),
    _buildTextSpan(' " \$Salary "\n', false),
    _buildTextSpan('        }\n', false),
    _buildTextSpan('      }\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$project":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "fieldOfStudy":', false),
    _buildTextSpan(' " \$_id ",\n', false),
    _buildTextSpan('      "_id":', false),
    _buildTextSpan(' 0,\n', false),
    _buildTextSpan('      "averageSkillGap":', false),
    _buildTextSpan(' 1,\n', false),
    _buildTextSpan('      "documents":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "\$filter":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('          "input":', false),
    _buildTextSpan(' " \$documents ",\n', false),
    _buildTextSpan('          "as":', false),
    _buildTextSpan(' "doc",\n', false),
    _buildTextSpan('          "cond":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('            "\$gte":', false),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('              " \$\$doc . skillsGap ",\n', false),
    _buildTextSpan('              5\n', false),
    _buildTextSpan('            ]\n', false),
    _buildTextSpan('          }\n', false),
    _buildTextSpan('        }\n', false),
    _buildTextSpan('      },\n', false),
    _buildTextSpan('      "howMany":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "\$size":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('          "\$filter":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('            "input":', false),
    _buildTextSpan(' " \$documents ",\n', false),
    _buildTextSpan('            "as":', false),
    _buildTextSpan(' "doc",\n', false),
    _buildTextSpan('            "cond":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('              "\$gte":', false),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('                " \$\$doc . skillsGap ",\n', false),
    _buildTextSpan('                5\n', false),
    _buildTextSpan('              ]\n', false),
    _buildTextSpan('            }\n', false),
    _buildTextSpan('          }\n', false),
    _buildTextSpan('        }\n', false),
    _buildTextSpan('      }\n', false),
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
