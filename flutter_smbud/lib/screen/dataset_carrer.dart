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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopBar(
        title: 'Carrer and change Dataset',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "structure of the json document",
                style: AppFonts.textBold,
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: SizedBox(
                width: screenWidth * 0.95,
                height: 420,
                child: Image.asset(
                  'assets/images/dataset/carrer2.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Example",
                style: AppFonts.textBold,
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: SizedBox(
                width: screenWidth * 0.90,
                height: 500,
                child: Image.asset(
                  'assets/images/dataset/carrer.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
