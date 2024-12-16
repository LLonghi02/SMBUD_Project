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
                'sameDegreeOccupation',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Find how many people are currently working in the same field they have a degree in',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10), // Spaziatura tra i componenti.

            QueryTWM2(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Output - Partial',
                style: AppFonts
                    .textBold2, // Assicurati che AppFonts.textRegular sia definito
              ),
            ),
            SizedBox(height: 10),
            OutputTWM2(),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomBar(), // Assicurati che BottomBar sia definito correttamente
    );
  }
}

class OutputTWM2 extends StatelessWidget {
  const OutputTWM2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
      TextSpan(
  children: [
    _buildTextSpan('[{\n', false),
    _buildTextSpan('  "tot": ', true),
    _buildTextSpan('379', false),
    _buildTextSpan(',\n  "Field": ', true),
    _buildTextSpan('"Law"', false),
    _buildTextSpan(',\n  "Occupation": ', true),
    _buildTextSpan('"Lawyer"', false),
    _buildTextSpan('\n},\n{\n', false),
    _buildTextSpan('  "tot": ', true),
    _buildTextSpan('389', false),
    _buildTextSpan(',\n  "Field": ', true),
    _buildTextSpan('"Economics"', false),
    _buildTextSpan(',\n  "Occupation": ', true),
    _buildTextSpan('"Economist"', false),
    _buildTextSpan('\n},\n{\n', false),
    _buildTextSpan('  "tot": ', true),
    _buildTextSpan('395', false),
    _buildTextSpan(',\n  "Field": ', true),
    _buildTextSpan('"Psychology"', false),
    _buildTextSpan(',\n  "Occupation": ', true),
    _buildTextSpan('"Psychologist"', false),
    _buildTextSpan('\n},\n{\n', false),
    _buildTextSpan('  "tot": ', true),
    _buildTextSpan('415', false),
    _buildTextSpan(',\n  "Field": ', true),
    _buildTextSpan('"Computer Science"', false),
    _buildTextSpan(',\n  "Occupation": ', true),
    _buildTextSpan('"Software Developer"', false),
    _buildTextSpan('\n},\n{\n', false),
    _buildTextSpan('  "tot": ', true),
    _buildTextSpan('354', false),
    _buildTextSpan(',\n  "Field": ', true),
    _buildTextSpan('"Business"', false),
    _buildTextSpan(',\n  "Occupation": ', true),
    _buildTextSpan('"Business Analyst"', false),
    _buildTextSpan('\n},\n{\n', false),
    _buildTextSpan('  "tot": ', true),
    _buildTextSpan('352', false),
    _buildTextSpan(',\n  "Field": ', true),
    _buildTextSpan('"Arts"', false),
    _buildTextSpan(',\n  "Occupation": ', true),
    _buildTextSpan('"Artist"', false),
    _buildTextSpan('\n},\n{\n', false),
    _buildTextSpan('  "tot": ', true),
    _buildTextSpan('397', false),
    _buildTextSpan(',\n  "Field": ', true),
    _buildTextSpan('"Biology"', false),
    _buildTextSpan(',\n  "Occupation": ', true),
    _buildTextSpan('"Biologist"', false),
    _buildTextSpan('\n},\n{\n', false),
    _buildTextSpan('  "tot": ', true),
    _buildTextSpan('405', false),
    _buildTextSpan(',\n  "Field": ', true),
    _buildTextSpan('"Medicine"', false),
    _buildTextSpan(',\n  "Occupation": ', true),
    _buildTextSpan('"Doctor"', false),
    _buildTextSpan('\n}\n]', false),
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
    _buildTextSpan('    "\$match":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "\$or":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('        { "\$and":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('          { "Field of Study": "Psychology" },\n', false),
    _buildTextSpan('          { "Current Occupation": "Psychologist" }\n', false),
    _buildTextSpan('        ]\n', false),
    _buildTextSpan('        },\n', false),
    _buildTextSpan('        { "\$and":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('          { "Field of Study": "Medicine" },\n', false),
    _buildTextSpan('          { "Current Occupation": "Doctor" }\n', false),
    _buildTextSpan('        ]\n', false),
    _buildTextSpan('        },\n', false),
    _buildTextSpan('        { "\$and":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('          { "Field of Study": "Education" },\n', false),
    _buildTextSpan('          { "Current Occupation": "Teacher" }\n', false),
    _buildTextSpan('        ]\n', false),
    _buildTextSpan('        },\n', false),
    _buildTextSpan('        { "\$and":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('          { "Field of Study": "Arts" },\n', false),
    _buildTextSpan('          { "Current Occupation": "Artist" }\n', false),
    _buildTextSpan('        ]\n', false),
    _buildTextSpan('        },\n', false),
    _buildTextSpan('        { "\$and":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('          { "Field of Study": "Computer Science" },\n', false),
    _buildTextSpan('          { "Current Occupation": "Software Developer" }\n', false),
    _buildTextSpan('        ]\n', false),
    _buildTextSpan('        },\n', false),
    _buildTextSpan('        { "\$and":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('          { "Field of Study": "Business" },\n', false),
    _buildTextSpan('          { "Current Occupation": "Business Analyst" }\n', false),
    _buildTextSpan('        ]\n', false),
    _buildTextSpan('        },\n', false),
    _buildTextSpan('        { "\$and":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('          { "Field of Study": "Mechanical Engineering" },\n', false),
    _buildTextSpan('          { "Current Occupation": "Mechanical Engineer" }\n', false),
    _buildTextSpan('        ]\n', false),
    _buildTextSpan('        },\n', false),
    _buildTextSpan('        { "\$and":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('          { "Field of Study": "Biology" },\n', false),
    _buildTextSpan('          { "Current Occupation": "Biologist" }\n', false),
    _buildTextSpan('        ]\n', false),
    _buildTextSpan('        },\n', false),
    _buildTextSpan('        { "\$and":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('          { "Field of Study": "Law" },\n', false),
    _buildTextSpan('          { "Current Occupation": "Lawyer" }\n', false),
    _buildTextSpan('        ]\n', false),
    _buildTextSpan('        },\n', false),
    _buildTextSpan('        { "\$and":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('          { "Field of Study": "Economics" },\n', false),
    _buildTextSpan('          { "Current Occupation": "Economist" }\n', false),
    _buildTextSpan('        ]\n', false),
    _buildTextSpan('        }\n', false),
    _buildTextSpan('      ]\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$group":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "_id": {\n', false),
    _buildTextSpan('        "Field": "\$Field of Study",\n', false),
    _buildTextSpan('        "Occupation": "\$Current Occupation"\n', false),
    _buildTextSpan('      },\n', false),
    _buildTextSpan('      "tot": { "\$sum": 1 }\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "\$project":', true),
    _buildTextSpan(' {\n', false),
    _buildTextSpan('      "Field": "\$_id.Field",\n', false),
    _buildTextSpan('      "Occupation": "\$_id.Occupation",\n', false),
    _buildTextSpan('      "tot": 1,\n', false),
    _buildTextSpan('      "_id": 0\n', false),
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
