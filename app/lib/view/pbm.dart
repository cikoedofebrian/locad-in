import 'package:flutter/material.dart';

class PBM extends StatelessWidget {
  const PBM({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Data Pemain SepakBola'),
            ...List.generate(
              3,
              (index) => Card(
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.face,
                      size: 40,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama Pemain 2'),
                      Text('Negara Asal'),
                      Text('Klub'),
                      Row(
                        children: List.generate(
                          4,
                          (index) => Icon(
                            Icons.star,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
    // axis because Columns are vertical (the cross axis would be
// This trailing comma makes auto-formatting nicer for build methods.
  }
}
