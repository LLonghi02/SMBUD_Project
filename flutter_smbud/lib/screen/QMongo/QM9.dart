import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QM9 extends ConsumerStatefulWidget {
  const QM9({super.key});

  @override
  ConsumerState<QM9> createState() => _QM9State();
}

class _QM9State extends ConsumerState<QM9> {
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
                'Gender distribution Analysis pt.2',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'For each pair of positions and education level, it calculates the distribution of men and women',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10), // Spaziatura tra i componenti.

            QueryTWM9(),

 Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Output - Partial',
                style: AppFonts
                    .textBold2, // Assicurati che AppFonts.textRegular sia definito
              ),
            ),
            SizedBox(height: 10),
            OutputTWM9(),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomBar(), // Assicurati che BottomBar sia definito correttamente
    );
  }
}

class OutputTWM9 extends StatelessWidget {
  const OutputTWM9({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
TextSpan(
  children: [
    _buildTextSpan('[\n', true),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "occupation":', true),
    _buildTextSpan(' " Artist ",\n', false),
    _buildTextSpan('    "educationLevel":', true),
    _buildTextSpan(' "PhD",\n', false),
    _buildTextSpan('    "menCount":', true),
    _buildTextSpan(' 476,\n', false),
    _buildTextSpan('    "womenCount":', true),
    _buildTextSpan(' 492\n', false),
    _buildTextSpan('  },...\n', false),
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
class QueryTWM9 extends StatelessWidget {
  const QueryTWM9({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
   TextSpan(
  children: [
   _buildTextSpan('SMBUD_project . Carrer . aggregate ([\n', true),
    _buildTextSpan('[\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan(' {}\n', false),
    _buildTextSpan('    "\$group": {\n', true),
    _buildTextSpan('      "_id": {\n', false),
    _buildTextSpan('        "occupation":', false),
    _buildTextSpan(' " \$Current Occupation ",\n', false),
    _buildTextSpan('        "gender":', false),
    _buildTextSpan(' " \$Gender ",\n', false),
    _buildTextSpan('        "educationLevel":', false),
    _buildTextSpan(' " \$Education Level "\n', false),
    _buildTextSpan('      },\n', false),
    _buildTextSpan('      "count":', false),
    _buildTextSpan(' { \$sum : 1 }\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    
    _buildTextSpan('  {\n', false),
    _buildTextSpan(' {}\n', false),
    _buildTextSpan('    "\$group": {\n', true),
    _buildTextSpan('      "_id": {\n', false),
    _buildTextSpan('        "occupation":', false),
    _buildTextSpan(' " \$_id . occupation ",\n', false),
    _buildTextSpan('        "educationLevel":', false),
    _buildTextSpan(' " \$_id . educationLevel "\n', false),
    _buildTextSpan('      },\n', false),
    _buildTextSpan('      "countsByGender": {\n', false),
    _buildTextSpan('        "\$push": {\n', false),
    _buildTextSpan('          "gender":', false),
    _buildTextSpan(' " \$_id . gender ",\n', false),
    _buildTextSpan('          "count":', false),
    _buildTextSpan(' " \$count "\n', false),
    _buildTextSpan('        }\n', false),
    _buildTextSpan('      }\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    
    _buildTextSpan('  {\n', false),
    _buildTextSpan(' {}\n', false),
    _buildTextSpan('    "\$project":', true),
  
    _buildTextSpan('      " {\n      _id":', false),
    _buildTextSpan(' 0,\n', false),
    _buildTextSpan('      "occupation":', false),
    _buildTextSpan(' " \$_id . occupation ",\n', false),
    _buildTextSpan('      "educationLevel":', false),
    _buildTextSpan(' " \$_id . educationLevel ",\n', false),
    _buildTextSpan('      "menCount": {\n', false),
    _buildTextSpan('        "\$reduce": {\n', false),
    _buildTextSpan('          "input":', false),
    _buildTextSpan(' " \$countsByGender ",\n', false),
    _buildTextSpan('          "initialValue":', false),
    _buildTextSpan(' 0,\n', false),
    _buildTextSpan('          "in": {\n', false),
    _buildTextSpan('            "\$cond": [\n', false),
    _buildTextSpan('              { "\$eq": [ " \$\$this . gender ", " Male " ] },\n', false),
    _buildTextSpan('              { "\$add": [ " \$\$value ", " \$\$this . count " ] },\n', false),
    _buildTextSpan('              " \$\$value "\n', false),
    _buildTextSpan('            ]\n', false),
    _buildTextSpan('          }\n', false),
    _buildTextSpan('        }\n', false),
    _buildTextSpan('      },\n', false),
    _buildTextSpan('      "womenCount": {\n', false),
    _buildTextSpan('        "\$reduce": {\n', false),
    _buildTextSpan('          "input":', false),
    _buildTextSpan(' " \$countsByGender ",\n', false),
    _buildTextSpan('          "initialValue":', false),
    _buildTextSpan(' 0,\n', false),
    _buildTextSpan('          "in": {\n', false),
    _buildTextSpan('            "\$cond": [\n', false),
    _buildTextSpan('              { "\$eq": [ " \$\$this . gender ", " Female " ] },\n', false),
    _buildTextSpan('              { "\$add": [ " \$\$value ", " \$\$this . count " ] },\n', false),
    _buildTextSpan('              " \$\$value "\n', false),
    _buildTextSpan('            ]\n', false),
    _buildTextSpan('          }\n', false),
    _buildTextSpan('        }\n', false),
    _buildTextSpan('      }\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    
    // Final Sort
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$sort"', true),
    _buildTextSpan(' : { "occupation": 1 }\n }\n', false),
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
