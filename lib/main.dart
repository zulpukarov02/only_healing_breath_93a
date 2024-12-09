import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:only_healing_breath_93a/providers/provider_technique.dart';
import 'package:only_healing_breath_93a/technique.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TechniqueProvider(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          title: 'Breathing Techniques',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const Technique(),
        ),
      ),
    );
  }
}
