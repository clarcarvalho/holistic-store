import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importando intl para formatação de moeda
import 'package:holistic/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  // Função para formatar o preço com o símbolo de Real (R$)
  String formatCurrency(double price) {
    final format = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return format.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300, // Altura do carrossel
              child: PageView.builder(
                itemCount: product.imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    product.imageUrls[
                        index], // Exibindo imagens do array imageUrls
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Preço: ${formatCurrency(product.price)}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            const Text(
              'Descrição:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.description ?? 'Descrição não disponível',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
