import 'package:holistic/product.dart';

class MockAPI {
  // Função para simular login com email e senha
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    // Simula um delay como se fosse uma requisição real
    await Future.delayed(Duration(seconds: 1));

    // Verificação das credenciais (simulação de uma autenticação)
    if (email == 'clara.carvalho@email.com' && password == '123456') {
      // Retorna um token simulado para sucesso
      return {
        'status': 'success',
        'token': 'mocked-jwt-token', // token simulado
      };
    } else {
      // Retorna erro caso as credenciais estejam erradas
      return {'status': 'error', 'message': 'Credenciais inválidas'};
    }
  }

  static List<Product> getProducts() {
    return [
      Product(
          id: "1",
          name: "Ametista",
          price: 35.00,
          imageUrl: "assets/images/ametista.jpg",
          description: "Kit com 5 unidades de Ametista lapidada.",
          stars: 5,
          imageUrls: [
            "assets/images/ametista.jpg",
            "assets/images/ametista_2.jpg",
            "assets/images/ametista_4.jpg"
          ]),
      Product(
          id: "2",
          name: "Quartzo Rosa",
          price: 52.99,
          imageUrl: "assets/images/quartzo-rosa.jpg",
          description: "Kit com 10 unidades de Quartzo Rosa (predra bruta).",
          stars: 4,
          imageUrls: [
            "assets/images/quartzo-rosa.jpg",
            "assets/images/quartzo rosa 2.jpg",
            "assets/images/quarto rosa 3.jpg",
            "assets/images/quartzo rosa 4.jpg"
          ]),
      Product(
          id: "3",
          name: "Quartzo Verde",
          price: 51.99,
          imageUrl: "assets/images/quartzo-verde.jpg",
          description: "Kit com 10 unidades de Quartzo Verde (predra bruta).",
          stars: 5,
          imageUrls: [
            "assets/images/quartzo-verde.jpg",
            "assets/images/quartzo verde 2.jpg",
            "assets/images/quartzo verde 3.jpg"
          ]),
      Product(
          id: "4",
          name: "Ametista Bruta",
          price: 20.00,
          imageUrl: "assets/images/ametista-bruta.jpg",
          description: "Kit com 5 unidades de Ametista bruta.",
          stars: 2,
          imageUrls: [
            "assets/images/ametista.jpg",
            "assets/images/ametista_bruta_2.jpg",
            "assets/images/ametista_bruta_3.jpg",
            ""
          ]),
    ];
  }
}
