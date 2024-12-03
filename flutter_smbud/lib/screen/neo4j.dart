import 'package:flutter_smbud/importer.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Neo4j',
      home: Neo4j(),
    );
  }
}

class Neo4j extends ConsumerWidget {
  const Neo4j({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final backcolor = ref.watch(backgroundProvider);

    return Scaffold(
      backgroundColor: backcolor,
      appBar: const TopBar(),
      body: const Column(
        children: [

        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
