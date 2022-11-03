// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String ticket = '';

  readQrCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      true,
      ScanMode.QR,
    );

    setState(() {
      ticket = code != '-1' ? code : 'Inválido';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR-Code Scanner'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (ticket != '')
              Padding(
                padding: EdgeInsets.only(bottom: 24.0),
                child: AlertDialog(
                  title: const Text('QR Code'),
                  content: Text(
                    '$ticket',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            FloatingActionButton(
              onPressed: readQrCode,
              child: Icon(Icons.qr_code_2_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
