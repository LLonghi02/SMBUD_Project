import 'package:flutter_smbud/importer.dart'; // Assicurati che AppFonts, TopBar, BottomBar siano correttamente definiti

class QM10 extends ConsumerStatefulWidget {
  const QM10({super.key});

  @override
  ConsumerState<QM10> createState() => _QM10State();
}

class _QM10State extends ConsumerState<QM10> {
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
                'Carrer Salary trend',
                style: AppFonts
                    .textBold, // Assicurati che AppFonts.textBold sia definito
                textAlign: TextAlign.center,
              ),
            ),

            // Descrizione del titolo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'it calculates the salary trend for each position by number of experience',
                style: AppFonts
                    .textQ, // Assicurati che AppFonts.textRegular sia definito
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10), // Spaziatura tra i componenti.

            QueryTWM10(),
 Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Output - partial',
                style: AppFonts
                    .textBold2, // Assicurati che AppFonts.textRegular sia definito
              ),
            ),
            SizedBox(height: 10),
            OutputTWM10(),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomBar(), // Assicurati che BottomBar sia definito correttamente
    );
  }
}

class OutputTWM10 extends StatelessWidget {
  const OutputTWM10({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
TextSpan(
  children: [
    _buildTextSpan('[\n', true),
    
    // Esempio per l'occupazione "Doctor"
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "occupation":', true),
    _buildTextSpan(' " Doctor ",\n', false),
    _buildTextSpan('    "progression":', true),
    _buildTextSpan(' [...]\n', false),
    _buildTextSpan('  },\n', false),
    
    // Esempio per l'occupazione "Lawyer"
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "occupation":', true),
    _buildTextSpan(' " Lawyer ",\n', false),
    _buildTextSpan('    "progression":', true),
    _buildTextSpan(' [...]\n', false),
    _buildTextSpan('  },\n', false),
    
    // Esempio per l'occupazione "Economist"
    _buildTextSpan('  {\n', false),
    _buildTextSpan('    "occupation":', true),
    _buildTextSpan(' " Economist ",\n', false),
    _buildTextSpan('    "progression":', true),
    _buildTextSpan(' [\n', false),
    _buildTextSpan('      111829.96551724138,\n', false),
    _buildTextSpan('      111638.35643564357,\n', false),
    _buildTextSpan('      119633.24509803922,\n', false),
    _buildTextSpan('      115185.45192307692,\n', false),
    _buildTextSpan('      113446.07142857143,\n', false),
    _buildTextSpan('      123441.76923076923,\n', false),
    _buildTextSpan('      110961.87912087912,\n', false),
    _buildTextSpan('      115924.43564356436,\n', false),
    // Aggiungi altre voci della progression array come necessario
    _buildTextSpan('    ]\n', false),
    _buildTextSpan('  },\n', false),
    
    // Altri dati, se ce ne sono
    // _buildTextSpan('  {...}\n', false),
    
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
class QueryTWM10 extends StatelessWidget {
  const QueryTWM10({super.key});

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
    _buildTextSpan('    "\$group"', true),
    _buildTextSpan(' : {\n     "_id": {\n', false),
    _buildTextSpan('        "occupation":', false),
    _buildTextSpan(' " \$Current Occupation ",\n', false),
    _buildTextSpan('        "yearsOfExperience":', false),
    _buildTextSpan(' " \$Years of Experience "\n', false),
    _buildTextSpan('      },\n', false),
    _buildTextSpan('      "avgSalary":', true),
    _buildTextSpan(' { \$avg : " \$Salary " }\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
    
    _buildTextSpan('  {\n', false),
    _buildTextSpan(' {}\n', false),
    _buildTextSpan('    "\$sort": {\n', true),
    _buildTextSpan('      "_id. occupation":', false),
    _buildTextSpan(' 1,\n', false),
    _buildTextSpan('      "_id. yearsOfExperience":', false),
    _buildTextSpan(' 1\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
        _buildTextSpan('  {\n', false),
    _buildTextSpan(' {}\n', false),
    _buildTextSpan('    "\$group"', true),
    _buildTextSpan(' : {\n     "_id":', false),
    _buildTextSpan(' " \$_id . occupation ",\n', false),
    _buildTextSpan('      "progression": {\n', false),
    _buildTextSpan('        "\$push":', false),
    _buildTextSpan(' " \$avgSalary "\n', false),
    _buildTextSpan('      }\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  },\n', false),
        _buildTextSpan('  {\n', false),
    _buildTextSpan(' {}\n', false),
    _buildTextSpan('    "\$project"', true),
    _buildTextSpan(' : {\n     "_id":', false),
    _buildTextSpan(' 0,\n', false),
    _buildTextSpan('      "occupation":', false),
    _buildTextSpan(' " \$_id ",\n', false),
    _buildTextSpan('      "progression":', false),
    _buildTextSpan(' " \$progression "\n', false),
    _buildTextSpan('    }\n', false),
    _buildTextSpan('  }\n', false),
    
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
