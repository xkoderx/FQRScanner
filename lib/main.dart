import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiuerr/providers/scan_list_provider.dart';
import 'package:qiuerr/providers/ui_provider.dart';
import 'package:qiuerr/screens/home.dart';
import 'package:qiuerr/screens/mapa.dart';

void main() => runApp(const QR());

class QR extends StatelessWidget {
  const QR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScanListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (_) => Home(),
          'mapa': (_) => Mapa(),
        },
        theme: ThemeData(
          primaryColor: Colors.black,
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(backgroundColor: Colors.teal),
        ),
      ),
    );
  }
}
