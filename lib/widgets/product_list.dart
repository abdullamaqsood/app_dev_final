import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/product_bloc.dart';
import '../models/product_model.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          return SizedBox(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final ProductModel product = state.products[index];
                return Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(product.image,
                                height: 80,
                                width: double.infinity,
                                fit: BoxFit.cover),
                          ),
                          const Positioned(
                            top: 4,
                            right: 4,
                            child:
                                Icon(Icons.favorite_border, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text("2% cashback",
                          style: TextStyle(color: Colors.pink, fontSize: 12)),
                      Text(product.name,
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      Text("\$${product.price.toStringAsFixed(2)}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
