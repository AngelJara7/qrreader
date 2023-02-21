import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {

  final String tipo;

  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
   final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    
    return ListView.builder(
      itemCount: scanListProvider.scans.length,
      itemBuilder: (_, int i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection) => {
          Provider.of<ScanListProvider>(context, listen: false).borrarScansPorId(scans[i].id!.toInt())
        },
        child: ListTile(
          leading: Icon(
            tipo == "http" 
            ? Icons.home
            : Icons.map, 
            color: Theme.of(context).primaryColor,),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
          onTap: () => launchUrl(context, scans[i]),
        ),
      )
    );
  }
}