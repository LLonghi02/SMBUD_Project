import 'package:flutter_smbud/importer.dart';

class DSFood extends ConsumerStatefulWidget {
  const DSFood({super.key});

  @override
  ConsumerState<DSFood> createState() => _DSFoodState();
}

class _DSFoodState extends ConsumerState<DSFood> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopBar(
        title: 'Foodmart Dataset',
      ),
      body: SingleChildScrollView(
        child: Center( // Aggiunto Center per centrare tutto il contenuto
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Allineamento verticale
            crossAxisAlignment: CrossAxisAlignment.center, // Allineamento orizzontale
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Nodes and their relationships",
                  style: AppFonts.textBold,
                  textAlign: TextAlign.center, // Testo centrato
                ),
              ),
              SizedBox(
                width: screenWidth * 0.98, // Larghezza proporzionale
                height: 300,
                child: Image.asset(
                  'assets/images/dataset/food.png', // Percorso dell'immagine
                  fit: BoxFit.contain, // Centra l'immagine senza ritagliarla
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Example of nodes relationship",
                  style: AppFonts.textBold,
                  textAlign: TextAlign.center, // Testo centrato
                ),
              ),
              SizedBox(
                width: screenWidth * 0.90,
                height: 280,
                child: Image.asset(
                  'assets/images/dataset/es_node.png', // Percorso dell'immagine
                  fit: BoxFit.contain,
                ),
              ),
               const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Node Labels and Their Properties",
                  style: AppFonts.textBold,
                  textAlign: TextAlign.center, // Testo centrato
                ),
              ),
              SizedBox(
                width: screenWidth * 0.90,
                height: 400,
                child: Image.asset(
                  'assets/images/dataset/food2.png', // Percorso dell'immagine
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
