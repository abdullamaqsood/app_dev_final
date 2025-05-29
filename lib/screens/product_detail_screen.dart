import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.88);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFDEEEE), Color(0xFFE5D0F8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(),
              const SizedBox(height: 10),
              _buildCardSwiper(),
              const SizedBox(height: 20),
              _buildTransactionsHeader(),
              Expanded(child: _buildTransactionsList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg'),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Cards',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const Icon(Icons.help_outline),
        ],
      ),
    );
  }

  Widget _buildCardSwiper() {
    final cards = [
      {
        "name": "World",
        "number": "5413 7502 3412 2455",
        "label": "Account card"
      },
      {
        "name": "Visa",
        "number": "4213 7540 1290 1123",
        "label": "Main account"
      },
      {
        "name": "Master",
        "number": "5312 4301 9981 0022",
        "label": "Backup card"
      },
    ];

    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: _pageController,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return _buildCard(card['name']!, card['number']!, card['label']!);
        },
      ),
    );
  }

  Widget _buildCard(String name, String number, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const Spacer(),
          const Icon(Icons.credit_card, color: Colors.yellow, size: 32),
          const SizedBox(height: 10),
          Text(number,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildTransactionsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Last activities",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Open all", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildTransactionsList() {
    final transactions = [
      {'title': 'Netflix', 'date': '15 Dec 2024', 'amount': '\$15.48'},
      {'title': 'Spotify', 'date': '14 Dec 2024', 'amount': '\$19.90'},
      {'title': 'Netflix', 'date': '12 Dec 2024', 'amount': '\$15.48'},
    ];

    return ListView.builder(
      itemCount: transactions.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final tx = transactions[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFF2F2F2),
                child: Icon(Icons.star_border, color: Colors.black),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tx['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(tx['date']!,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
              Text(tx['amount']!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
  }
}
