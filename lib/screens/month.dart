import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../domain/EventDataSource.dart';

class MonthScreen extends StatefulWidget {
  @override
  State<MonthScreen> createState() => _MonthScreenState();
}

class _MonthScreenState extends State<MonthScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          flex: 3,
          child: Consumer<EventDataSource>(
            builder: (BuildContext context, value, Widget? child) {
              return SfCalendar(dataSource: value, view: CalendarView.month);
            },
          )),
      Expanded(flex: 2, child: DayReview())
    ]);
  }
}

class DayReview extends StatefulWidget {
  @override
  State<DayReview> createState() => _DayReviewState();
}

class _DayReviewState extends State<DayReview> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Expanded(flex: 7, child: Container()),
            Expanded(
              flex: 86,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: Colors.grey,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //TODO 여기에 세이브 버튼 넣어서 TextFormField 세이브
                      controller: _textEditingController,
                      maxLines: 4,
                      decoration: InputDecoration(hintText: '오늘 하루는 어땠나요?'),
                    )),
              ),
            ),
            Expanded(flex: 7, child: Container())
          ],
        )
      ],
    );
  }
}
