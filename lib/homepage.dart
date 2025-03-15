import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              // Seção de saudação
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey,
                    child: Text('J', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Oi, Jean',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'O que você está precisando hoje?',
                style: TextStyle(fontSize: 20, color: Colors.purple, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              // Barra de pesquisa com ícone de filtro ao lado direito
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60, // Altura reduzida do TextField
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Pesquise...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Espaçamento entre o TextField e o ícone
                  IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      color: Colors.purple,
                      size: 35,
                    ),
                    onPressed: () {
                      // Adicione aqui a lógica do filtro, se desejar
                      print('Filtro clicado!');
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Seção de Destaques (rolagem horizontal)
              Text(
                'Destaques',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildProfessionalCard('Rogério Silva', 'Mecânico', 'R\$ 75/Hora'),
                    SizedBox(width: 10), // Espaçamento entre os cards
                    _buildProfessionalCard('Sérgio', 'Mec', 'R\$ 4/Hora'),
                    SizedBox(width: 10), // Espaçamento entre os cards
                    _buildProfessionalCard('Ana Costa', 'Eletricista', 'R\$ 60/Hora'),
                    SizedBox(width: 10),
                    _buildProfessionalCard('João Pereira', 'Pintor', 'R\$ 50/Hora'),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Seção de Filtros
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text('Todos', style: TextStyle(color: Colors.purple)),
                    SizedBox(width: 10),
                    Text('Eletricista'),
                    SizedBox(width: 10),
                    Text('Encanador'),
                    SizedBox(width: 10),
                    Text('Pintor'),
                    SizedBox(width: 10),
                    Text('Jardineiro'),
                    SizedBox(width: 10),
                    Text('Limpeza'),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Lista de Profissionais
              _buildProfessionalCard('Rogério Silva', 'Mecânico', 'R\$ 75/Hora'),
              _buildProfessionalCard('Sérgio Oliveira', 'Eletricista', 'R\$ 58/Hora'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfessionalCard(String name, String profession, String rate) {
    // Separar o valor e a unidade para estilização diferente
    List<String> rateParts = rate.split('/');
    String amountWithCurrency = rateParts[0]; // Ex.: "R$ 75"
    String unit = rateParts.length > 1 ? '/${rateParts[1]}' : ''; // Ex.: "/Hora"

    // Separar "R$" e o valor numérico
    List<String> amountParts = amountWithCurrency.split(' ');
    String currency = amountParts[0]; // Ex.: "R$"
    String amount = amountParts[1]; // Ex.: "75"

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: Colors.grey, // Contorno cinza
          width: 1.0, // Largura da borda
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    profession,
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          currency,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.purple,
                          ),
                        ),
                        SizedBox(width: 2),
                        Text(
                          amount,
                          style: TextStyle(
                            fontSize: 24, // Preço maior
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 2),
                    Text(
                      unit,
                      style: TextStyle(
                        fontSize: 12, // Mesmo tamanho do "R$"
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}