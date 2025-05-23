import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  List<Map<String, dynamic>> basketItems = [
    {
      'title': 'Sanita Club Biodegradable',
      'price': 25.99,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQavcMVvrXn7KoldH8-1IiGNwLbh0mFtskAgA&s',
      'quantity': 1,
    },
    {
      'title': 'Pepsi Can 330ml',
      'price': 3.50,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWm8nJlEPObT1-XdlBT7CagggnQ4t7pjGFEQ&s',
      'quantity': 2,
    },
  ];

  void increaseQuantity(int index) {
    setState(() {
      basketItems[index]['quantity']++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (basketItems[index]['quantity'] > 1) {
        basketItems[index]['quantity']--;
      }
    });
  }

  int get totalItems =>
      basketItems.fold(0, (sum, item) => sum + (item['quantity'] as int));

  double get totalPrice => basketItems.fold(
        0.0,
        (sum, item) =>
            sum + ((item['price'] as double) * (item['quantity'] as int)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.appGrey),
                    borderRadius: BorderRadius.circular(7)),
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.darkGrey,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        title: Text(
          'My Basket',
          style: textTheme(context).headlineLarge?.copyWith(
                color: colorScheme(context).primary,
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Total Items: $totalItems',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: basketItems.length,
              itemBuilder: (context, index) {
                final item = basketItems[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            item['image'],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Title, Price & Quantity
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['title'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(height: 6),
                              Text(
                                  'Price: AED ${item['price'].toStringAsFixed(2)}'),
                              const SizedBox(height: 16),

                              // Quantity Controls aligned to bottom right
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () =>
                                            decreaseQuantity(index),
                                        icon: const Icon(Icons.remove_circle,
                                            size: 28, color: Colors.green),
                                      ),
                                      Text(
                                        item['quantity'].toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () =>
                                            increaseQuantity(index),
                                        icon: const Icon(Icons.add_circle,
                                            size: 28, color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Price:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'AED ${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
