import 'package:flutter/material.dart';
import 'package:qiuerr/models/scan_model.dart';
import 'package:qiuerr/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';
  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    //asignar el id de la base de datos al modelo
    nuevoScan.id = id;
    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    var scans = await DBProvider.db.getAllScans();
    scans = [...scans];
    notifyListeners();
  }

  cargarScanporTipo(String tipo) async {
    var scans = await DBProvider.db.getScansByType(tipo);
    scans = [...scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrartTodos() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrartById(int? id) async {
    await DBProvider.db.deleteScan(id!);
    cargarScanporTipo(tipoSeleccionado);
  }
}
