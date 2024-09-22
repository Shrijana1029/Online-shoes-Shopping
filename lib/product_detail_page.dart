// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';

class ProductDetailPage extends StatefulWidget {
  // final int selectedSize;
  final Map<String, dynamic> product;
  const ProductDetailPage({super.key,
  required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late int selectedSize;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedSize = widget.product['sizes'][0];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Details')),
      ),
      body: Column(
        children: [
          Center(
            child: Text(widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(flex: 2,),
          // const Spacer()

          Container(

            height: 250,
             decoration: BoxDecoration(
               color: const Color(0xDCDCAE96),
               borderRadius: BorderRadius.circular(40),
             ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text('\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height:10 ),
                SizedBox(
                  height: 50 ,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index){
                      final size = (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: ()
                          {
                            //whe user tap on chip the va;ue of size is updated
                            //in selectedSize then the setsaste rebuild the UI and we get the selected one in yellow color
                           setState(() {
                             selectedSize = size;
                           });
                          },
                          child: Chip(
                            backgroundColor: selectedSize == size ? Theme.of(context).colorScheme.primary: const Color.fromRGBO(245, 247, 249, 1),
                              label: Text('$size'),
                          ),
                        ),
                      );

                      }
                  ),
                ),
                // const SizedBox(height:10 ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(

                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(double.infinity, 50),

                      ),
                       child: const Text('Add to Cart', style: TextStyle(color: Colors.black),),
                  ),
                )
              ],
            ),
          ),



        ],

      ),
    );
  }
}
