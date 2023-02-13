import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_pages.dart';
import 'package:qr_reader/pages/mapas_pages.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigatiorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Historial"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),

      body: _HomePageBody(),

      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    
    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return MapasPages();

      case 1:
        return DireccionesPages();
        
      default: 
        return MapasPages();
    }

  }
}