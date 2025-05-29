import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/banner_bloc.dart';
import '../blocs/category_bloc.dart';
import '../blocs/product_bloc.dart';

import '../repositories/banner_repository.dart';
import '../repositories/category_repository.dart';
import '../repositories/product_repository.dart';

import '../widgets/banner_slider.dart';
import '../widgets/category_list.dart';
import '../widgets/product_list.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => BannerBloc(BannerRepository())..add(LoadBanners())),
        BlocProvider(
            create: (_) =>
                CategoryBloc(CategoryRepository())..add(LoadCategories())),
        BlocProvider(
            create: (_) =>
                ProductBloc(ProductRepository())..add(LoadProducts())),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFFFDEEEE),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildSearchBar(),
                const SizedBox(height: 20),
                const CategoryList(),
                const SizedBox(height: 20),
                const Text("100 cashback",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                const BannerSlider(),
                const SizedBox(height: 20),
                _buildPopularHeader(),
                const SizedBox(height: 10),
                const ProductList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg'),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Wilson Junior",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Premium",
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
        Icon(Icons.card_giftcard_outlined),
        const SizedBox(width: 10),
        Icon(Icons.notifications_none),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.tune, color: Colors.black),
        )
      ],
    );
  }

  Widget _buildPopularHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text("Most popular offer",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("See all", style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
