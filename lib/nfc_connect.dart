import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_app/create.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcConnection extends StatefulWidget {
  @override
  _NfcConnectionState createState() => _NfcConnectionState();
}

class _NfcConnectionState extends State<NfcConnection> {
  void dataFind(int n) {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => CreateScreen(
            id: n,
          ),
        ),
      );
    });
  }

  void load() async {
    //bool isAvailable = await NfcManager.instance.isAvailable();
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        List<int> arr = tag.data["nfca"]["identifier"];
        int s = 0;
        for (int i = 0; i < min(4, arr.length); i++) {
          s <<= 8;
          s += arr[i];
        }
        dataFind(s);
      },
    );
  }

  @override
  initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.nfc,
              size: 64,
            ),
            Text(
              "В поисках метки...",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
