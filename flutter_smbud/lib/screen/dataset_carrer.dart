import 'package:flutter_smbud/importer.dart';

class DSCarrer extends ConsumerStatefulWidget {
  const DSCarrer({super.key});

  @override
  ConsumerState<DSCarrer> createState() => _DSCarrerState();
}

class _DSCarrerState extends ConsumerState<DSCarrer> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopBar(
        title: 'Carrer and change Dataset',
      ),
    body: SingleChildScrollView(
      
        child: Column(
          
          children: [
           /* const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "A description of each field included in the dataset:\n"
                "Field of Study: Represents the academic or disciplinary area of the individual's education.\n"
                "Current Occupation: Indicates the person’s current professional role.\n"
                "Age: The individual's current age.\n"
                "Gender: Specifies the individual's gender.\n"
                "Years of Experience: The total number of years the individual has worked professionally.\n"
                "Education Level: The highest level of education attained by the individual.\n"
                "Industry Growth Rate: Reflects the growth rate of the industry the person works in, categorized as low, medium, or high.\n"
                "Job Satisfaction: Measures the individual's satisfaction with their job on a numerical scale.\n"
                "Work-Life Balance: Indicates the balance between the individual’s work and personal life on a numerical scale.\n"
                "Job Opportunities: The number of available job opportunities in the individual's field or role.\n"
                "Salary: The individual’s annual income.\n"
                "Job Security: Measures the perceived stability of the individual's current job on a numerical scale.\n"
                "Career Change Interest: Indicates the individual’s interest in pursuing a career change, expressed numerically.\n"
                "Skills Gap: Measures the discrepancy between the individual's current skills and the skills required for their job.\n"
                "Family Influence: Indicates the level of influence family has on the individual's career decisions, categorized as low, medium, or high.\n"
                "Mentorship Available: Specifies whether a mentor is available to guide the individual in their career, expressed as a binary value.\n"
                "Certifications: The number of professional certifications the individual holds.\n"
                "Freelancing Experience: Indicates whether the individual has worked as a freelancer, expressed as a binary value.\n"
                "Geographic Mobility: Indicates the individual's willingness to relocate for work, expressed as a binary value.\n"
                "Professional Networks: Measures the strength and extent of the individual’s professional connections on a numerical scale.\n"
                "Career Change Events: The number of events that have influenced the individual's career changes.\n"
                "Technology Adoption: Indicates the individual's ability or willingness to adopt new technologies, expressed as a binary value.\n"
                "Likely to Change Occupation: Reflects the probability of the individual changing their current occupation, expressed as a binary value.",
                style: AppFonts.text, // Assicurati che AppFonts.text sia definito
                textAlign: TextAlign.left,
              ),
            ),*/
            SizedBox(
              width: screenWidth*0.90, // Larghezza uguale allo schermo
              height: screenHeight * 0.80, // Altezza al 90% dello schermo
              child: Image.asset(
                'assets/images/dataset/carrer.png', // Percorso dell'immagine
                fit: BoxFit.contain, // Centra l'immagine senza ritagliarla
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
