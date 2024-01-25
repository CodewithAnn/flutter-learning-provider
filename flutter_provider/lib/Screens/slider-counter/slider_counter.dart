import 'package:flutter/material.dart';
import 'package:flutter_provider/Provider/slider_counter.dart';
import 'package:provider/provider.dart';

class SliderCounter extends StatefulWidget {
  const SliderCounter({super.key});

  @override
  State<SliderCounter> createState() => _SliderCounterState();
}

class _SliderCounterState extends State<SliderCounter> {
  @override
  Widget build(BuildContext context) {
    // final sliderProvider = Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Counter"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Text(
                value.valueDouble.toString(),
                style: const TextStyle(fontSize: 40),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Slider(
                    min: 0,
                    max: 100,
                    value: value.valueDouble,
                    onChanged: (number) {
                      value.getIncreseValue(number);
                    },
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
