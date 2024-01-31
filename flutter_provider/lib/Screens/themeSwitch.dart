import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
        actions: [
          FlutterSwitch(
            value: isDark,
            onToggle: (value) {},
            activeIcon: SvgPicture.asset("assets/images/moon.svg"),
            inactiveIcon: SvgPicture.asset("assets/images/sun.svg"),
            toggleSize: 30,
            height: 40,
            toggleColor: Colors.yellow,
            inactiveColor: Colors.yellow.shade200,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.yellow.shade900,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.green.shade600,
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
