import 'package:flutter/material.dart';

void main() {
  runApp(GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GroceryPage(),
    );
  }
}

class GroceryPage extends StatefulWidget {
  const GroceryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GroceryPageState createState() => _GroceryPageState();
}

class _GroceryPageState extends State<GroceryPage> {
  final List<Map<String, dynamic>> _cart = [];

  void _addToCart(Map<String, dynamic> item) {
    setState(() {
      bool itemExists = false;

      for (var cartItem in _cart) {
        if (cartItem['name'] == item['name']) {
          cartItem['quantity'] = (cartItem['quantity'] as int) + 1;
          itemExists = true;
          break;
        }
      }

      if (!itemExists) {
        _cart.add({'name': item['name'], 'image': item['image'], 'quantity': 1});
      }
    });
  }

  void _removeFromCart(Map<String, dynamic> item) {
    setState(() {
      for (var cartItem in _cart) {
        if (cartItem['name'] == item['name']) {
          cartItem['quantity'] = (cartItem['quantity'] as int) - 1;
          if (cartItem['quantity'] == 0) {
            _cart.remove(cartItem);
          }
          break;
        }
      }
    });
  }

  int _getQuantity(String itemName) {
    for (var cartItem in _cart) {
      if (cartItem['name'] == itemName) {
        return cartItem['quantity'] as int;
      }
    }
    return 0;
  }

  int _getTotalItems() {
    int totalItems = 0;
    for (var cartItem in _cart) {
      totalItems += cartItem['quantity'] as int;
    }
    return totalItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery Items'),
        backgroundColor: const Color(0xFF279AF1),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCartPage(cart: _cart)),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GroceryGrid(
              addToCart: _addToCart,
              removeFromCart: _removeFromCart,
              getQuantity: _getQuantity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyCartPage(cart: _cart)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF279AF1),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'View Cart (${_getTotalItems()} items)',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GroceryGrid extends StatelessWidget {
  final List<Map<String, dynamic>> groceries = [
    {
      'name': 'Rice 1Kg',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Apples',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Bananas',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Carrots',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Broccoli',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  final Function(Map<String, dynamic>) addToCart;
  final Function(Map<String, dynamic>) removeFromCart;
  final Function(String) getQuantity;

  GroceryGrid({
    super.key,
    required this.addToCart,
    required this.removeFromCart,
    required this.getQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: groceries.length,
      itemBuilder: (context, index) {
        return GroceryItemCard(
          name: groceries[index]['name'],
          imageUrl: groceries[index]['image'],
          addToCart: () => addToCart(groceries[index]),
          removeFromCart: () => removeFromCart(groceries[index]),
          quantity: getQuantity(groceries[index]['name']),
        );
      },
    );
  }
}

class GroceryItemCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback addToCart;
  final VoidCallback removeFromCart;
  final int quantity;

  const GroceryItemCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.addToCart,
    required this.removeFromCart,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              imageUrl,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: removeFromCart,
                ),
                ElevatedButton(
                  onPressed: addToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF279AF1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    quantity > 0 ? '$quantity' : 'ADD',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addToCart,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyCartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cart;

  const MyCartPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: const Color(0xFF279AF1),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(cart[index]['image']),
            title: Text(cart[index]['name']),
            trailing: Text('Quantity: ${cart[index]['quantity']}'),
          );
        },
      ),
    );
  }
}
