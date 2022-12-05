import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_today/palette.dart';
import 'package:green_today/screens/setting.dart';

class TodayScreen extends StatefulWidget {
  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingScreen()));
                  },
                  child: const Icon(Icons.settings)),
            ],
          ),
        ),
      ),
      body: DayView(
        showVerticalLine: true,
        controller: CalendarControllerProvider.of(context).controller,
        timeLineWidth: 66,
      ),
    );
  }
}

class PercentPalette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<ColorTile>.generate(11, (index) {
        if (index == 0) {
          return ColorTile(GreenPicker.getGreenFor(index), text: '0');
        } else if (index == 10) {
          return ColorTile(GreenPicker.getGreenFor(index), text: '100');
        } else {
          return ColorTile(GreenPicker.getGreenFor(index));
        }
      }),
    );
  }

  const PercentPalette({super.key});
}

class ColorTile extends StatelessWidget {
  final Color _color;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
            color: _color,
            child: SizedBox(
              height: 20,
              child: text != null ? Text(text!) : null,
            )));
  }

  const ColorTile(this._color, {super.key, this.text});
}
