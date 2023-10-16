import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiuerr/providers/providers.dart';
import 'package:qiuerr/screens/screens.dart';
import 'package:qiuerr/widgets/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('Historial'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final scanListProvider =
                  Provider.of<ScanListProvider>(context, listen: false);
              scanListProvider.borrartTodos();
            },
            icon: const Icon(Icons.delete_forever),
            color: Colors.red,
          )
        ],
      ),
      body: _HomeBody(),
      bottomNavigationBar: const CustomBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    //usar el scanlistprovider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScanporTipo('geo');
        return Hmapa();
      case 1:
        scanListProvider.cargarScanporTipo('http');
        return Url();
      default:
        return Hmapa();
    }
  }
}
