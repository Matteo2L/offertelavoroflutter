import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/pages/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'title',
        theme: ThemeData(),
        home: const MainPage(),
      );
}
