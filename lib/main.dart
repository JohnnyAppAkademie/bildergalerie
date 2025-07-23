import 'package:bildergalerie/logic/style/style_manager.dart';
import 'package:bildergalerie/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /*  Provider für den Style-Manager */
    ChangeNotifierProvider(create: (_) => StyleManager(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StyleManager>(
      builder: (context, styleManager, _) {
        final style = styleManager.style;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
          theme: ThemeData(scaffoldBackgroundColor: style.background),
        );
      },
    );
  }
}
