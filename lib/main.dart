import 'package:flutter/material.dart';
import './src/components/title_section.dart';
import './src/components/button_section.dart';
import './src/components/text_section.dart';
import './src/components/image_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter app'),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(image: 'lib/assets/img-unsplash.jpg'),
              TitleSection(name: 'digidaw', location: 'jawa barat'),
              ButtonSection(),
              TextSection(
                description:
                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the '            
                  'Bernese Alps. Situated 1,578 meters above sea level, it '            
                  'is one of the larger Alpine Lakes. A gondola ride from '            
                  'Kandersteg, followed by a half-hour walk through pastures '            
                  'and pine forest, leads you to the lake, which warms to 20 '            
                  'degrees Celsius in the summer. Activities enjoyed here '            
                  'include rowing, and riding the summer toboggan run.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

