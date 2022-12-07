import 'package:flutter/material.dart';
import 'package:green_today/business/calendar_event_control.dart';
import 'package:green_today/domain/EventDataSource.dart';
import 'package:green_today/domain/event.dart';
import 'package:green_today/palette.dart';
import 'package:green_today/repo/EventRepository.dart';
import 'package:green_today/screens/add_event_dialog.dart';
import 'package:green_today/screens/setting.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:time/time.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const TodayHeader(),
            Expanded(child: Consumer<EventController>(
              builder: (BuildContext context, eventController,
                  Widget?
                  child) {
                return SfCalendar(
                  dataSource: eventController.dataSource,
                  onLongPress: (calendarLongPressDetails) {
                    final startTime = calendarLongPressDetails.date!;
                    final endTime = startTime + 1.hours;
                    final newEvent = Event(startTime: startTime, endTime:
                    endTime, subject: "Hello");
                    newEvent.color = GreenPicker.p30.color;

                    eventController.addEvent(newEvent);

                    showDialog(context: context, builder: (context) => AddEventDialog());
                  },
                );
              },))
          ],
        ),
        floatingActionButton: EventAddButton());
  }

  void _onCalendarLongPress(CalendarLongPressDetails longPressDetails) {
    final capturedDate = longPressDetails.date;
  }
}

class EventAddButton extends StatelessWidget {
  const EventAddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(context: context, builder: (context) {
          return const SettingDialog();
        });
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        backgroundColor: GreenPicker.p80.color,
      ),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}

class TodayHeader extends StatelessWidget {
  const TodayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 36,
          child: IconButton(
              onPressed: () {
                showDialog(context: context,
                    builder: (context) => const SettingDialog());
              },
              icon: const Icon(Icons.settings)),
        ),
        ..._percentPalette()
      ],
    );
  }

  List<Widget> _percentPalette() {
    return List<ColorTile>.generate(11, (index) {
      if (index == 0) {
        return ColorTile(
          GreenPicker.getGreenFor(index),
          text: const Text(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              "0"),
        );
      } else if (index == 10) {
        return ColorTile(
          GreenPicker.getGreenFor(index),
          text: const Text(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              "100"),
        );
      } else {
        return ColorTile(GreenPicker.getGreenFor(index));
      }
    });
  }
}

class ColorTile extends StatelessWidget {
  final Color _color;
  final Text? text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
            color: _color,
            child: SizedBox(
              height: 26,
              child: text,
            )));
  }

  const ColorTile(this._color, {super.key, this.text});
}
