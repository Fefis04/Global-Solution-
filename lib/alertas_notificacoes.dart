import 'package:flutter/material.dart';

class AlertasNotificacoes extends StatelessWidget {
  void _showConsumptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Consumo de Aparelhos'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.tv),
                title: Text('TV'),
                subtitle: Text('Tempo ligado: 5 horas'),
              ),
              ListTile(
                leading: Icon(Icons.lightbulb),
                title: Text('Lâmpada da Sala'),
                subtitle: Text('Tempo ligado: 8 horas'),
              ),
              ListTile(
                leading: Icon(Icons.kitchen),
                title: Text('Geladeira'),
                subtitle: Text('Tempo ligado: 24 horas'),
              ),
              ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text('Ar-Condicionado'),
                subtitle: Text('Tempo ligado: 6 horas'),
              ),
              ListTile(
                leading: Icon(Icons.router),
                title: Text('Roteador Wi-Fi'),
                subtitle: Text('Tempo ligado: 24 horas'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('Alertas e Notificações'),
        backgroundColor: Colors.green[50], 
        elevation: 0, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.warning),
                    title: Text('Pico de Consumo'),
                    subtitle: Text('Consumo de energia muito alto!'),
                  ),
                  ListTile(
                    leading: Icon(Icons.notification_important),
                    title: Text('Manutenção Necessária'),
                    subtitle: Text('Bateria do painel solar precisa de manutenção.'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                _showConsumptionDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, 
                ),
              ),
              child: Text(
                'Visualizar Consumo',
                style: TextStyle(
                  color: Colors.white, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
