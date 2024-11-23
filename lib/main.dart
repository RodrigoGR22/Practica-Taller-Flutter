import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notas App',
      home: NoteBoardScreen(),
    );
  }
}

class NoteBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Cambiado el color de fondo
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.dashboard_customize, color: Colors.purple), // Nuevo icono
            SizedBox(width: 10),
            Text('Mi Tablero de Notas'), 
          ],
        ),
        backgroundColor: Colors.purple[200], // Nuevo color de AppBar
        elevation: 4, // Aumentada la elevación
        titleTextStyle: TextStyle(
          color: Colors.white, 
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCard('Ideas', [
                      'Design Moodboard',
                      'Product Ideas',
                      'Feature Ideas',
                      'Research Findings',
                    ], Colors.orange), // Añadido color personalizado
                  ],
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    _buildCard('En Progreso', [
                      'API Design',
                      'Hi-Fi Prototypes',
                      'Edge Case Designs',
                    ], Colors.blue), // Añadido color personalizado
                  ],
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    _buildCard('Completado', [
                      'Information Architecture',
                      'Code Convention',
                      'Competitor Analysis',
                      'Wireframes',
                    ], Colors.green), // Añadido color personalizado
                  ],
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    _buildCard('Objetivos', [
                      'MVP',
                      'Launch Plans',
                    ], Colors.purple), // Añadido color personalizado
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_task), // Nuevo icono
        backgroundColor: Colors.purple, // Color del FAB
      ),
    );
  }

  Widget _buildCard(String title, List<String> items, MaterialColor cardColor) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: cardColor.shade200, width: 1), // Nuevo borde
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: cardColor.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.label_important, color: cardColor), // Nuevo icono
                  SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: cardColor.shade700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.drag_indicator, // Nuevo icono
                        size: 20,
                        color: cardColor.shade300,
                      ),
                      SizedBox(width: 8),
                      Text(
                        item,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add_circle_outline, color: cardColor), // Nuevo icono
              label: Text(
                'Añadir Tarea',
                style: TextStyle(color: cardColor),
              ),
              style: TextButton.styleFrom(
                backgroundColor: cardColor.shade50,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}