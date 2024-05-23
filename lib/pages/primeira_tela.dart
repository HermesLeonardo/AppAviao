import 'package:flutter/material.dart';

class PrimeiraTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003049),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 2),
            Image.asset('assets/images/logo_airtravel.png', height: 260),
            Spacer(flex: 1),

            Text(
              'OLÁ PILOTO!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Spacer(flex: 5), 
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, 
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10), 
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'COMEÇAR ROTA',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward, color: Colors.black), 
                ],
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}