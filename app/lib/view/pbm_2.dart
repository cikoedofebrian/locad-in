import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class PBM2 extends StatefulWidget {
  const PBM2({super.key});

  @override
  State<PBM2> createState() => _PBM2State();
}

class _PBM2State extends State<PBM2> {
  var isChecked = false;
  var dateTime = DateFormat("dd-MM-yyyy").format(DateTime.now());

  check() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tugas PBM2'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            TextField(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dateTime),
                IconButton(
                  onPressed: () async {
                    final pick = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime(DateTime.now().year + 1),
                    );

                    if (pick != null) {
                      setState(() {
                        dateTime = DateFormat("dd-MM-yyyy").format(pick);
                      });
                    }
                  },
                  icon: Icon(Icons.calendar_month),
                )
              ],
            ),
            Checkbox(value: isChecked, onChanged: (value) => check()),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text('This button was pressed'),
                      actions: [
                        ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Close'))
                      ],
                    ),
                  );
                },
                child: Text('Show Dialog')),
          ]),
        ),
      ),
    );
  }
}
