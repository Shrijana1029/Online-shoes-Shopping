// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_page.dart';

import 'package:shop_app_flutter/product_list.dart';


final
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [ProductList(), CartPage()];

  @override


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      //in body index 0 that is product list is shown first
      body: IndexedStack(
        index: currentPage,
        children:pages

      ),
      bottomNavigationBar: BottomNavigationBar(
        // In short, currentPage is updated first, and then the currentIndex reflects this updated value when the widget re-renders.
        currentIndex: currentPage,
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value){
          setState(() {
            currentPage = value;
          });

        },
        items:const  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
          )

        ],
      )



    );
  }
}
