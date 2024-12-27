import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:x_counter_app/controller/getx/counter_get_controller.dart';
import 'package:x_counter_app/controller/provider/counter_provider.dart';

class CounterPage extends StatelessWidget {
  final CounterGetController controller = Get.put(CounterGetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // GetX Section
          Text(
            'Using GetX:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Obx(() => Text(
            'Count: ${controller.count.value}',
            style: TextStyle(fontSize: 24),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: controller.increment,
                child: Text('Increment'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: controller.decrement,
                child: Text('Decrement'),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Provider Section
          Text(
            'Using Provider:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Consumer<CounterProvider>(
            builder: (context, counterProvider, child) {
              return Text(
                'Count: ${counterProvider.count}',
                style: TextStyle(fontSize: 24),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Provider.of<CounterProvider>(context, listen: false).increment();
                },
                child: Text('Increment'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Provider.of<CounterProvider>(context, listen: false).decrement();
                },
                child: Text('Decrement'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
