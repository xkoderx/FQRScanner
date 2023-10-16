import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiuerr/providers/providers.dart';
import 'package:qiuerr/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;
  const ScanTiles({super.key, required this.tipo});
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        direction: DismissDirection.endToStart,
        onDismissed: (direction) =>
            Provider.of<ScanListProvider>(context, listen: false)
                .borrartById(scans[i].id),
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        child: ListTile(
          leading: Icon(
            tipo == 'http' ? Icons.http : Icons.map,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: () {
            launchUrl(context, scans[i]);
          },
        ),
      ),
    );
  }
}
