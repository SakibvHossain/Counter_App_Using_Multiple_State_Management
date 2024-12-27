import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x_counter_app/controller/provider/counter_provider.dart';
import 'package:x_counter_app/ui/screens/counter_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider())
      ],
      child: CounterPage(),),
    );
  }
}
