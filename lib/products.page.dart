import 'package:flutter/material.dart';
import 'package:holistic/login.page.dart';
import 'package:holistic/mockapi.dart';
import 'package:intl/intl.dart';
import 'package:holistic/product.dart'; // Certifique-se de importar a classe Product
import 'package:holistic/product_detail_page.dart';
import 'stars.component.dart'; // Importe a classe StarsComponent

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  ProductListstate createState() => ProductListstate();
}

class ProductListstate extends State<ProductsPage> {
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    // Inicializa a lista de produtos ao carregar a página
    filteredProducts = MockAPI.getProducts();
  }

  // Função para formatar o preço com o símbolo de Real (R$)
  String formatCurrency(double price) {
    final format = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return format.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple,
                  const Color.fromARGB(255, 249, 161, 190)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Cristais sublimes',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                          (Route<dynamic> route) => false);
                    },
                    child: Text('Sair',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)))
              ],
              automaticallyImplyLeading: false,
            )),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (ctx, index) {
          final product = filteredProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    height: 140,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      formatCurrency(product.price),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StarsComponent(
                        rating: product.stars), // Aqui usamos o StarsComponent
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
