import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/category_bloc.dart';
import '../models/category_model.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  Icon _getIconForCategory(String name) {
    switch (name.toLowerCase()) {
      case 'earn 100%':
        return const Icon(Icons.card_giftcard, color: Colors.black);
      case 'tax note':
        return const Icon(Icons.receipt_long, color: Colors.black);
      case 'primum':
        return const Icon(Icons.diamond, color: Colors.black);
      case 'challenge':
        return const Icon(Icons.videogame_asset, color: Colors.black);
      case 'more':
        return const Icon(Icons.more_horiz, color: Colors.black);
      default:
        return const Icon(Icons.category, color: Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoryLoaded) {
          final sortedCategories = List<CategoryModel>.from(state.categories);
          sortedCategories.sort((a, b) {
            if (a.name.toLowerCase() == 'more') return 1;
            if (b.name.toLowerCase() == 'more') return -1;
            return 0;
          });

          return SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sortedCategories.length,
              itemBuilder: (context, index) {
                final cat = sortedCategories[index];
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: _getIconForCategory(cat.name),
                        ),
                        const SizedBox(height: 5),
                        Text(cat.name, style: const TextStyle(fontSize: 12)),
                      ],
                    ),
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
