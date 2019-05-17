import 'package:flutter/material.dart';
import '../models/models.dart';


class WaitSendTask extends StatefulWidget {

  final TaskEntity task;

  WaitSendTask({
    Key key,
    @required this.task
  }) : super(key: key);

  @override
  _WaitSendTaskState createState() => _WaitSendTaskState();
}

class _WaitSendTaskState extends State<WaitSendTask> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text('12334444444'),
    );
  }
}
