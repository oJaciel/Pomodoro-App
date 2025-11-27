import 'package:flutter/material.dart';

class TimeEnter extends StatelessWidget {
  const TimeEnter({
    super.key,
    required this.title,
    required this.value,
    this.inc,
    this.dec,
  });

  final String title;
  final int value;
  final void Function()? inc;
  final void Function()? dec;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(fontSize: 25)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: dec,
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                backgroundColor: Colors.red,
              ),
              child: Icon(Icons.arrow_downward, color: Colors.white),
            ),
            Text('${value.toString()} min', style: TextStyle(fontSize: 18)),
            ElevatedButton(
              onPressed: inc,
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                backgroundColor: Colors.red,
              ),
              child: Icon(Icons.arrow_upward, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
