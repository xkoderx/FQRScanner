import 'package:flutter/material.dart';
import 'package:qiuerr/models/scan_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future launchUrl(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  if (scan.tipo == 'http') {
    if (!await launchUrlString(url)) {
      throw 'Could not launch $url';
    } else {
      throw 'couldnt launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
