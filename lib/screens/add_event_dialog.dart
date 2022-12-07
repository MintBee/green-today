import 'package:flutter/material.dart';

import '../domain/time.dart';

class AddEventDialog extends StatefulWidget {
  const AddEventDialog({super.key});

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SimpleTime startTime = SimpleTime(0, 0);
  SimpleTime endTime = SimpleTime(0, 0);
  int achievementRate = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    "  Start Time Set     ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: startTime.hour,
                      items: List.generate(24, (i) {
                        if (i<10) {
                          return DropdownMenuItem(
                              value: i,
                              child: Text('0$i')
                          );
                        }
                        return DropdownMenuItem(
                            value: i,
                            child: Text('$i')
                        );
                      }),
                      onChanged: (int? value) {
                        setState(() {
                          startTime.hour = value!;
                        });
                      },
                    ),
                  ),
                  const Text(
                    " : ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: startTime.minute,
                      items: List.generate(60, (i) {
                        if (i<10) {
                          return DropdownMenuItem(
                              value: i,
                              child: Text('0$i')
                          );
                        }
                        return DropdownMenuItem(
                            value: i,
                            child: Text('$i')
                        );
                      }),
                      onChanged: (int? value) {
                        setState(() {
                          startTime.minute = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    "   End Time Set      ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: endTime.hour,
                      items: List.generate(24, (i) {
                        if (i<10) {
                          return DropdownMenuItem(
                              value: i,
                              child: Text('0$i')
                          );
                        }
                        return DropdownMenuItem(
                            value: i,
                            child: Text('$i')
                        );
                      }),
                      onChanged: (int? value) {
                        setState(() {
                          endTime.hour = value!;
                        });
                      },
                    ),
                  ),
                  const Text(
                    " : ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: endTime.minute,
                      items: List.generate(60, (i) {
                        if (i<10) {
                          return DropdownMenuItem(
                              value: i,
                              child: Text('0$i')
                          );
                        }
                        return DropdownMenuItem(
                            value: i,
                            child: Text('$i')
                        );
                      }),
                      onChanged: (int? value) {
                        setState(() {
                          endTime.minute = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'To do',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const Text(
                  "Achievement Rate",
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    value: achievementRate,
                    items: List.generate(11, (i) {
                      return DropdownMenuItem(
                          value: i*10,
                          child: Text('${i*10}')
                      );
                    }),
                    onChanged: (int? value) {
                      setState(() {
                        achievementRate = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextButton(
                onPressed: () {
                  ///여기 너가 한다는 건가...?
                  Navigator.pop(context);
                },
                // 버튼에 텍스트 부여
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

