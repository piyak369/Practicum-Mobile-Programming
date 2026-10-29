
import 'package:flutter/material.dart';
import 'models/product.dart';
import 'services/product_service.dart';
import 'pages/product_detail_page.dart';

void main() {
  runApp(const ProductCatalogApp());
}

class ProductCatalogApp extends StatelessWidget {
  const ProductCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Catalog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductService service = ProductService();

  late Future<List<Product>> futureProducts;

  String searchQuery = '';
  String sortOrder = 'default';

  @override
  void initState() {
    super.initState();
    futureProducts = service.fetchProducts();
  }

  void reloadProducts() {
    setState(() {
      futureProducts = service.fetchProducts();
    });
  }

  List<Product> processProducts(List<Product> products) {
    final filteredProducts = products.where((product) {
      return product.title
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();

    if (sortOrder == 'asc') {
      filteredProducts.sort(
            (a, b) => a.price.compareTo(b.price),
      );
    } else if (sortOrder == 'desc') {
      filteredProducts.sort(
            (a, b) => b.price.compareTo(a.price),
      );
    }

    return filteredProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Catalog',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: reloadProducts,
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            tooltip: 'Refresh Products',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              16,
              16,
              8,
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              children: [
                const Text('Sort by price:'),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: sortOrder,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'default',
                        child: Text('Default'),
                      ),
                      DropdownMenuItem(
                        value: 'asc',
                        child: Text('Lowest Price'),
                      ),
                      DropdownMenuItem(
                        value: 'desc',
                        child: Text('Highest Price'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        sortOrder = value ?? 'default';
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Product>>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 50,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Failed to load products.',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: reloadProducts,
                            child: const Text('Try Again'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                final products = processProducts(
                  snapshot.data ?? [],
                );

                if (products.isEmpty) {
                  return const Center(
                    child: Text('No products found.'),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: products.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailPage(
                                    product: product,
                                  ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Image.network(
                                    product.thumbnail,
                                    fit: BoxFit.contain,
                                    errorBuilder:
                                        (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.image_not_supported,
                                        size: 50,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    product.rating.toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
