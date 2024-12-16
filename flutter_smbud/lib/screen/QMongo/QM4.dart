import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QM4 extends ConsumerStatefulWidget {
  const QM4({super.key});

  @override
  ConsumerState<QM4> createState() => _QM1State();
}

class _QM1State extends ConsumerState<QM4> {
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
                'Education vs. Salary Analysis',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Find which education level have a better average salary',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10), // Spaziatura tra i componenti.

            QueryTWM4(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Output ',
                style: AppFonts
                    .textBold2, // Assicurati che AppFonts.textRegular sia definito
              ),
            ),
            SizedBox(height: 10),
            OutputTWM4(),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomBar(), // Assicurati che BottomBar sia definito correttamente
    );
  }
}

class OutputTWM4 extends StatelessWidget {
  const OutputTWM4({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
        TextSpan(
          children: [
            _buildTextSpan('{', false),
            _buildTextSpan('"averageSalary":', true),
            _buildTextSpan(' 115348.93935604877,\n', false),
            _buildTextSpan('"educationLevel":', true),
            _buildTextSpan(' "Master ’s"\n', false),
            _buildTextSpan('},\n', false),
            _buildTextSpan('{', false),
            _buildTextSpan('"averageSalary":', true),
            _buildTextSpan(' 115320.96336686077,\n', false),
            _buildTextSpan('"educationLevel":', true),
            _buildTextSpan(' "Bachelor ’s"\n', false),
            _buildTextSpan('},\n', false),
            _buildTextSpan('{', false),
            _buildTextSpan('"averageSalary":', true),
            _buildTextSpan(' 114665.00756878388,\n', false),
            _buildTextSpan('"educationLevel":', true),
            _buildTextSpan(' "PhD"\n', false),
            _buildTextSpan('},\n', false),
            _buildTextSpan('{', false),
            _buildTextSpan('"averageSalary":', true),
            _buildTextSpan(' 114579.17316287289,\n', false),
            _buildTextSpan('"educationLevel":', true),
            _buildTextSpan(' "High School "\n', false),
            _buildTextSpan('}\n', false),
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

class QueryTWM4 extends StatelessWidget {
  const QueryTWM4({super.key});

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
            _buildTextSpan(' "\$Education Level",\n', false),
            _buildTextSpan('      "averageSalary":', false),
            _buildTextSpan(' {\n', false),
            _buildTextSpan('        "\$avg":', false),
            _buildTextSpan(' "\$Salary"\n', false),
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
            _buildTextSpan('      "educationLevel":', false),
            _buildTextSpan(' "\$_id",\n', false),
            _buildTextSpan('      "_id":', true),
            _buildTextSpan(' 0,\n', false),
            _buildTextSpan('      "averageSalary":', false),
            _buildTextSpan(' 1\n', false),
            _buildTextSpan('    }\n', false),
            _buildTextSpan('  },\n', false),
            _buildTextSpan('  {\n', false),
            _buildTextSpan('    "\$sort":', true),
            _buildTextSpan(' {\n', false),
            _buildTextSpan('      "averageSalary":', false),
            _buildTextSpan(' -1\n', false),
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
