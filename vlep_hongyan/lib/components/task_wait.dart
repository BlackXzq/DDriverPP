import 'package:flutter/material.dart';
import '../models/models.dart';
import '../utils/utils.dart';

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

  Widget _buildTaskNumWidget() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.check_circle,
          color: VLEPTheme.primaryColor,
        ),
        Icon(
          Icons.check_circle_outline,
          color: VLEPTheme.greyDark,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final double ScreenW = MediaQuery.of(context).size.width;
    final double ScreenH = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)),
        child: Container(
          width: ScreenW,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _buildTaskNumWidget(),
              Text('ACD'),
              Text('ACD'),
              Text('ACD'),
              Text('ACD'),
              Text('ACD'),
            ],
          ),
        ),
      ),
    );
  }
}