// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/product_card.dart';
import 'package:shop_app_flutter/product_detail_page.dart';


final
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['ALL', 'Adidas', 'Nike', 'Puma',"Caliber", "Goldstar"];
  late String selectedFilter;
  final shree = 'shree';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //it will show All section
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),

    );
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //###############SEARCH PART#############
             Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Shoes\nCollection', style: Theme.of(context).textTheme.titleLarge
                  ),
                ),
                const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                    )
                )
              ],
            ),

            //##########################category part#################


            SizedBox(
              height: 120,
              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                  itemBuilder: (context, index){
                  //each items are kept in new filter variable
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                       backgroundColor: selectedFilter == filter ?
                       Theme.of(context).colorScheme.primary:
                       const Color.fromRGBO(245, 247, 249, 1),
                        elevation: 1,
                        label: Text(filter),
                        labelStyle: const TextStyle(
                          fontSize: 16
                        ),
                        side: const BorderSide(
                          color:  Color.fromRGBO(245, 247, 249, 1),
                          width: 1.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),

                        ),
                      ),
                    ),
                  );
                  },
              ),
            ),


            //##############SHOES SHOWING SECTION####################
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                  itemBuilder:(context, index){
                  final product = products[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                         return ProductDetailPage(product: product);
                        },
                      ),
                      );
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                      backgroundColor: index.isEven ?
                      const Color.fromRGBO(216, 240, 253, 1) :
                      const Color.fromRGBO(245, 247, 249, 1),
                      ),
                  );
                  },
              ),
            )
          ],
        ),
      )


    );
  }
}
