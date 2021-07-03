import 'package:flutter/material.dart';

class Job extends StatefulWidget {
  const Job({Key? key}) : super(key: key);

  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Job"),),);
  }
}
