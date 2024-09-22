import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/home_page.dart';
import 'package:shop_app_flutter/product_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      //it sets globally for entire app
      theme: ThemeData(
        textTheme: const TextTheme(
          // ######Text Theme
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )
        ),


        // ##########APPBAR
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black,
          )
        ),

        // ######InputDecoration THeme
        //design for all input textfield for default it can be override okay
        inputDecorationTheme: const InputDecorationTheme(
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )
        ),
        fontFamily: 'Lato',

        //##########Color Theme
        //GIVES COLOR FOR APP ITSELF BASED ON YELLOW
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1 , 1),
        ),
      ),




      title: 'Shoes Collection',
      home: const HomePage(),
      // ProductDetailPage(
      //   product: products[0],
      // ),
    );
  }
}



