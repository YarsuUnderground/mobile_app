import 'package:flutter/material.dart';
import 'package:mobile_app/nfc_connect.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: MaterialButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.nfc,
                      color: Colors.white,
                      size: 48,
                    ),
                    Text(
                      "  NFC",
                      style: TextStyle(color: Colors.white, fontSize: 36),
                    ),
                  ],
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NfcConnection(),
                    ),
                  );
                },
                height: 80,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: MaterialButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 48,
                    ),
                    Text(
                      " Голосом",
                      style: TextStyle(color: Colors.white, fontSize: 36),
                    ),
                  ],
                ),
                color: Colors.blue,
                onPressed: () {},
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
