// import 'dart:js_interop';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

import 'global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(Provider.of<CartProvider>(context).cart);
    return  Scaffold(

      appBar: AppBar(
        title: Center(child: const Text('Cart')),
      ),
      body: ListView.builder(
        itemCount: cart.length,
          itemBuilder: (context, index){
          final cartItem = cart[index];
           return ListTile(
             title: Text(cartItem['title'].toString(), style: Theme.of(context).textTheme.bodySmall,
             ),
             leading: CircleAvatar(
               radius: 30,
               backgroundImage: AssetImage(cartItem['imageUrl'] as String),
             ),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete), color: Colors.red,),

             // 1138
             subtitle: Text('Size: ${cartItem['sizes']}', style: Theme.of(context).textTheme.bodySmall,
             ),


           );

          }

      )
    );
  }
}
