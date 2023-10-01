import 'dart:async';

import 'package:denaya_apps/components/my_appbar.dart';
import 'package:denaya_apps/components/primary_button.dart';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  static const countdownDuration = Duration(minutes: 0);
  Duration duration = const Duration();
  Timer? timer;

  bool countDown = true;

  @override
  void initState() {
    super.initState();
    reset();
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = const Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 1), (_) => addTime());
  }

  void addTime() {
    final addMiliseconds = countDown ? 1 : -1;
    setState(() {
      final miliseconds = duration.inMilliseconds + addMiliseconds;
      if (miliseconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(milliseconds: miliseconds);
      }
    });
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    Widget buildTimeCard({required String time, required String header}) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Text(
                time,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(header, style: const TextStyle(color: Colors.black45)),
          ],
        );

    Widget buildTime() {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final seconds = twoDigits(duration.inSeconds.remainder(60));
      final milisecons = twoDigits(duration.inMilliseconds.remainder(1000));
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        buildTimeCard(time: minutes, header: 'MINUTES'),
        const SizedBox(
          width: 8,
        ),
        buildTimeCard(time: seconds, header: 'SECONDS'),
        const SizedBox(
          width: 8,
        ),
        buildTimeCard(time: milisecons, header: 'MILISECONDS'),
      ]);
    }

    Widget buildButtons() {
      final isRunning = timer == null ? false : timer!.isActive;
      return isRunning
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                    text: 'STOP',
                    onTap: () {
                      if (isRunning) {
                        stopTimer(resets: false);
                      }
                    }),
                const SizedBox(
                  width: 12,
                ),
                PrimaryButton(text: "CANCEL", onTap: stopTimer),
              ],
            )
          : PrimaryButton(
              text: "Start Timer!",
              color: Colors.black,
              onTap: () {
                startTimer();
              });
    }

    return Scaffold(
      appBar: myAppBar(context, title: 'Stopwatch', automaticImplyLeading: false, leading: true),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTime(),
            const SizedBox(
              height: 80,
            ),
            buildButtons()
          ],
        ),
      ),
    );
  }
}
