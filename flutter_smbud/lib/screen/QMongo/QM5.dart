import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QM5 extends ConsumerStatefulWidget {
  const QM5({super.key});

  @override
  ConsumerState<QM5> createState() => _QM5State();
}

class _QM5State extends ConsumerState<QM5> {
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
                'Gender Distribution Analysis',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'This query calculates the percentage distribution of genders within each field of study,providing insights into gender representation across disciplines.',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10), // Spaziatura tra i componenti.

            QueryTWM5(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Output - partial',
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

class OutputTWM5 extends StatelessWidget {
  const OutputTWM5({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
TextSpan(
  children: [
    _buildTextSpan('{', false),
    _buildTextSpan('"fieldOfStudy":', true),
    _buildTextSpan(' "Arts",\n', false),
    _buildTextSpan('"genderPercentages":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('{"gender":', true),
    _buildTextSpan(' "Male",\n', false),
    _buildTextSpan('"percentage":', true),
    _buildTextSpan(' 50.571352644166886', false),
    _buildTextSpan('},\n', false),
    _buildTextSpan('{"gender":', true),
    _buildTextSpan(' "Female",\n', false),
    _buildTextSpan('"percentage":', true),
    _buildTextSpan(' 49.428647355833114', false),
    _buildTextSpan('}\n', false),
    _buildTextSpan('],\n', false),
    _buildTextSpan('},\n', false),

    _buildTextSpan('{', false),
    _buildTextSpan('"fieldOfStudy":', true),
    _buildTextSpan(' "Business",\n', false),
    _buildTextSpan('"genderPercentages":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('{"gender":', true),
    _buildTextSpan(' "Male",\n', false),
    _buildTextSpan('"percentage":', true),
    _buildTextSpan(' 50.17857142857143', false),
    _buildTextSpan('},\n', false),
    _buildTextSpan('{"gender":', true),
    _buildTextSpan(' "Female",\n', false),
    _buildTextSpan('"percentage":', true),
    _buildTextSpan(' 49.82142857142857', false),
    _buildTextSpan('}\n', false),
    _buildTextSpan('],\n', false),
    _buildTextSpan('},\n', false),

    _buildTextSpan('{', false),
    _buildTextSpan('"fieldOfStudy":', true),
    _buildTextSpan(' "Mechanical Engineering",\n', false),
    _buildTextSpan('"genderPercentages":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('{"gender":', true),
    _buildTextSpan(' "Male",\n', false),
    _buildTextSpan('"percentage":', true),
    _buildTextSpan(' 50.59370160041301', false),
    _buildTextSpan('},\n', false),
    _buildTextSpan('{"gender":', true),
    _buildTextSpan(' "Female",\n', false),
    _buildTextSpan('"percentage":', true),
    _buildTextSpan(' 49.40629839958699', false),
    _buildTextSpan('}\n', false),
    _buildTextSpan('],\n', false),
    _buildTextSpan('},\n', false),

    _buildTextSpan('{', false),
    _buildTextSpan('"fieldOfStudy":', true),
    _buildTextSpan(' "Psychology",\n', false),
    _buildTextSpan('"genderPercentages":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('{"gender":', true),
    _buildTextSpan(' "Male",\n', false),
    _buildTextSpan('"percentage":', true),
    _buildTextSpan(' 50.56787452677123', false),
    _buildTextSpan('},\n', false),
    _buildTextSpan('{"gender":', true),
    _buildTextSpan(' "Female",\n', false),
    _buildTextSpan('"percentage":', true),
    _buildTextSpan(' 49.43212547322877', false),
    _buildTextSpan('}\n', false),
    _buildTextSpan('],\n', false),
    _buildTextSpan('},\n', false),
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

class QueryTWM5 extends StatelessWidget {
  const QueryTWM5({super.key});

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
    _buildTextSpan(' "\$Field of Study",\n', false),
    _buildTextSpan('        "gender":', false),
    _buildTextSpan(' "\$Gender"\n', false),
    _buildTextSpan('      },\n', false),
    _buildTextSpan('      "count":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "\$sum":', false),
    _buildTextSpan(' 1\n', false),
    _buildTextSpan('      }\n', false),
    _buildTextSpan('    },\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$group":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "_id":', false),
    _buildTextSpan(' " \$_id . fieldOfStudy ",\n', false),
    _buildTextSpan('      "total":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "\$sum":', false),
    _buildTextSpan(' " \$count "},\n', false),
    _buildTextSpan('      "genders":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "\$push":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('          "gender":', false),
    _buildTextSpan(' " \$_id . gender ",\n', false),
    _buildTextSpan('          "count":', false),
    _buildTextSpan(' " \$count "\n', false),
    _buildTextSpan('        }\n', false),
    _buildTextSpan('      }\n', false),
    _buildTextSpan('    },\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$match":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "_id":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "\$ne":', false),
    _buildTextSpan(' null\n', false),
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
    _buildTextSpan('      "genderPercentages":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('        "\$map":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('          "input":', false),
    _buildTextSpan(' " \$genders ",\n', false),
    _buildTextSpan('          "as":', false),
    _buildTextSpan(' " gender ",\n', false),
    _buildTextSpan('          "in":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('            "gender":', false),
    _buildTextSpan(' " \$\$gender . gender ",\n', false),
    _buildTextSpan('            "percentage":', false),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('              "\$multiply":', false),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('                {\n', false),
    _buildTextSpan('                  "\$divide":', false),
    _buildTextSpan(' [" \$\$gender . count ", " \$total "]\n', false),
    _buildTextSpan('                },\n', false),
    _buildTextSpan('                100\n', false),
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
