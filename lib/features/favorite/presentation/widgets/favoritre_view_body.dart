import 'package:flutter/material.dart';

class FavoritreViewBody extends StatelessWidget {
  const FavoritreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> favouriteItems = [
      {
        'name': 'Smart Camera',
        'price': 999.99,
        'imageUrl':
            'https://images.unsplash.com/photo-1593508512255-86ab42a8e620?auto=format&fit=crop&w=400&q=80',
      },
      {
        'name': 'Smart Light',
        'price': 149.99,
        'imageUrl':
            'https://images.unsplash.com/photo-1582719478250-dc7f1c776f84?auto=format&fit=crop&w=400&q=80',
      },
      {
        'name': 'Smart Lock',
        'price': 299.00,
        'imageUrl':
            'https://images.unsplash.com/photo-1597871208480-8b2093f6dbd5?auto=format&fit=crop&w=400&q=80',
      },
      {
        'name': 'Smart Sensor',
        'price': 199.00,
        'imageUrl':
            'https://images.unsplash.com/photo-1616469829581-73993eb86f2b?auto=format&fit=crop&w=400&q=80',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Favourites', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF00917C),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: favouriteItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final item = favouriteItems[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      item['imageUrl'],
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${item['price']} EGP',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.favorite,
                            color: const Color(0xFF00917C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
