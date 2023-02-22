import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher_string.dart';


launchUrl(BuildContext context, ScanModel scan) async {

  final Uri url = Uri.parse(scan.valor);
  
  if (scan.tipo == 'http') {
     if (!await launchUrlString(scan.valor)) {
    throw Exception('Could not launch $url');
  }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}