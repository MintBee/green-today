import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_today/palette.dart';
import 'package:green_today/screens/setting.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TodayScreen extends StatefulWidget {
  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 36,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SettingDialog()));
                      },
                      icon: const Icon(Icons.settings)),
                ),
                ..._percentPalette()
              ],
            ),
            Expanded(child: Consumer<CalendarDataSource>(
                builder: (BuildContext context, value, Widget? child) {
                  return SfCalendar(
                      dataSource: value,
                  );
                },))
          ],
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            showDialog(context: context, builder: (context) {
              return const SettingDialog();
            });
          },
          child: Icon(Icons.add, color: Colors.white),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            backgroundColor: GreenPicker.p80.color, // <-- Button color
          ),
        ));
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

  void _onCalendarLongPress(CalendarLongPressDetails longPressDetails) {
    final capturedDate = longPressDetails.date;
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
