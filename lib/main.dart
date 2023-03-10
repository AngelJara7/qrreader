import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/home_page.dart';
import 'package:qr_reader/pages/map_page.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider(),),
        ChangeNotifierProvider(create: (_) => ScanListProvider())
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QRReader',
        initialRoute: 'home',
        routes: {
          'home' : (BuildContext context) => const HomePage(),
          'mapa' : (BuildContext context) => const MapaPage()
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          colorScheme: const ColorScheme.light().copyWith(
            primary: Colors.deepPurple
          ),
          
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple
          ),

          primaryIconTheme: const IconThemeData(
            color: Colors.deepPurple
          )
        ),
      ),
    );
  }
}
