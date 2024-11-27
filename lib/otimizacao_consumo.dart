import 'package:flutter/material.dart';

class OtimizacaoConsumo extends StatefulWidget {
  @override
  _OtimizacaoConsumoState createState() => _OtimizacaoConsumoState();
}

class _OtimizacaoConsumoState extends State<OtimizacaoConsumo> {
  double selectedTemperature = 24.0;

  Future<void> _showTemperatureDialog(BuildContext context) async {
    double temp = selectedTemperature;

    await showDialog<double>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecione a Temperatura do Ar-Condicionado'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${temp.toStringAsFixed(0)}°C', style: TextStyle(fontSize: 24)),
                  Slider(
                    value: temp,
                    min: 16,
                    max: 30,
                    divisions: 14,
                    label: temp.toStringAsFixed(0),
                    onChanged: (double value) {
                      setState(() {
                        temp = value;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedTemperature = temp;
                });
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
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
        title: Text('Otimização de Consumo de Energia'),
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
                    leading: Icon(Icons.eco),
                    title: Text('Melhores Práticas'),
                    subtitle: Text('Ajuste a temperatura do ar-condicionado para 24°C.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.eco),
                    title: Text('Recomendações Personalizadas'),
                    subtitle: Text('Desligue aparelhos em stand-by durante a noite.'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showTemperatureDialog(context);
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
                'Otimizar',
                style: TextStyle(
                  color: Colors.white, 
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Temperatura selecionada: ${selectedTemperature.toStringAsFixed(0)}°C',
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
