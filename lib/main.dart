
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:user_list/provider/post_provider.dart';
import 'package:user_list/screen/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter API Fetch',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.montserratTextTheme(), // Apply Montserrat text theme
          tabBarTheme: TabBarTheme( // Proper TabBarTheme object
            labelStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: GoogleFonts.montserrat(),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.deepPurple, width: 2),
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
