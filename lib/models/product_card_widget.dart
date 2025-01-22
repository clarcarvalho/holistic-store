import 'package:flutter/material.dart';
import 'package:holistic/product.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;

  final Function() onPressed;
  final Function() onTap;

  const ProductCardWidget({
    super.key,
    required this.product,
    required this.onPressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Image.asset(
                product.imageUrl,
                width: double.infinity,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
              child: Text(
                product.name,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Text(
                'R\$ ${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
