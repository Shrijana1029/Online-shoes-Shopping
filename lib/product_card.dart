import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final Color backgroundColor;
  final String image;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor,

  });

  @override
  Widget build(BuildContext context) {
    return Container(


      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      margin: const EdgeInsets.all(20),

      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 5,),
          Text('\$$price', style: Theme.of(context).textTheme.bodySmall,),
          SizedBox(height: 5,),
         Center(child: Image.asset(image, height: 175,)),



        ],
      ),
    );
  }
}
