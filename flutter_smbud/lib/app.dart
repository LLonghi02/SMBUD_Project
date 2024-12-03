import 'package:flutter_smbud/importer.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Group 49',
      theme: ThemeData(
        /*colorScheme: ColorScheme.fromSeed(
          //seedColor: ref.watch(accentColorProvider),
          brightness: ref.watch(brightnessProvider),
        ),*/
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      home:     const Schermata(),
    );
  }
}

