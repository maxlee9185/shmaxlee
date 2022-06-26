import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shmaxlee/components/shmaxlee_colors.dart';
import 'package:shmaxlee/components/shmaxlee_constants.dart';
import 'package:shmaxlee/components/shmaxlee_widgets.dart';

import '../components/add_page_widget.dart';

class AddAlarmPage extends StatefulWidget {
  const AddAlarmPage(
      {Key? key, required this.medicineImage, required this.mediCineName})
      : super(key: key);

  final File? medicineImage;
  final String mediCineName;

  @override
  State<AddAlarmPage> createState() => _AddAlarmPageState();
}

class _AddAlarmPageState extends State<AddAlarmPage> {
  final _alarms = <String>{
    '08:00',
    '13:00',
    '21:00',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AddPageBody(children: [
        Text(
          "매일 복약 잊지 말아요!",
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: largeSpace),
        Expanded(
          child: ListView(
            children: alarmWidgets,
          ),
        ),
      ]),
      bottomNavigationBar: BottomSubmitButton(
        onPressed: () {},
        text: "완료",
      ),
    );
  }

  List<Widget> get alarmWidgets {
    final children = <Widget>[];
    children.addAll(
      _alarms.map(
        (alarmTime) => AlarmBox(
          time: alarmTime,
          onPressedMinus: () {
            setState(() {
              _alarms.remove(alarmTime);
            });
          },
        ),
      ),
    );
    children.add(AddAlarmButton(
      onPressed: () {
        final now = DateTime.now();
        final nowTime = DateFormat('HH:mm').format(now);
        setState(() {
          _alarms.add(nowTime);
        });
      },
    ));
    return children;
  }
}

class AlarmBox extends StatelessWidget {
  const AlarmBox({
    Key? key,
    required this.time,
    required this.onPressedMinus,
  }) : super(key: key);

  final String time;
  final VoidCallback onPressedMinus;

  @override
  Widget build(BuildContext context) {
    final initTime = DateFormat('HH:mm').parse(time);

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: onPressedMinus,
            icon: Icon(CupertinoIcons.minus_circle),
          ),
        ),
        Expanded(
          flex: 5,
          child: TextButton(
            style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.subtitle2),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return TimePickerBottomSheet(
                    initialDateTime: initTime,
                  );
                },
              );
            },
            child: Text(time),
          ),
        ),
      ],
    );
  }
}

class TimePickerBottomSheet extends StatelessWidget {
  const TimePickerBottomSheet({
    Key? key,
    required this.initialDateTime,
  }) : super(key: key);

  final DateTime initialDateTime;
  @override
  Widget build(BuildContext context) {
    return BottomSheetBody(
      children: [
        SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              onDateTimeChanged: (dateTime) {},
              mode: CupertinoDatePickerMode.time,
              initialDateTime: initialDateTime,
            )),
        const SizedBox(height: regularSpace),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: submitButtonHeight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.subtitle1,
                    primary: Colors.white,
                    onPrimary: ShmaxleeColors.primaryColor,
                  ),
                  onPressed: () {},
                  child: const Text('취소'),
                ),
              ),
            ),
            const SizedBox(width: smallSpace),
            Expanded(
              child: SizedBox(
                height: submitButtonHeight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.subtitle1,
                  ),
                  onPressed: () {},
                  child: const Text('선택'),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
          textStyle: Theme.of(context).textTheme.subtitle1),
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(CupertinoIcons.plus_circle_fill),
          ),
          Expanded(
            flex: 5,
            child: Center(child: Text('복용시간 추가')),
          ),
        ],
      ),
    );
  }
}
