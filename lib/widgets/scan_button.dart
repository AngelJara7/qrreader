import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus, color: Colors.white,),
      onPressed: () async {

        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#3D8BEF", "Cancelar", false, ScanMode.QR);
        //final barcodeScanRes = "http://google.com";
        //final barcodeScanRes = "geo:9.064131,-79.488376";

        if (barcodeScanRes == "-1") {
          return;
        }

        // ignore: use_build_context_synchronously
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

        // ignore: use_build_context_synchronously
        launchUrl(context, nuevoScan!);
      },
    );
  }
}