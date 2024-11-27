import 'package:flutter/material.dart';

class ControleDispositivos extends StatefulWidget {
  @override
  _ControleDispositivosState createState() => _ControleDispositivosState();
}

class _ControleDispositivosState extends State<ControleDispositivos> {
  bool arCondicionadoLigado = false;
  bool iluminacaoLigada = false;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  void alternarArCondicionado(bool valor) {
    setState(() {
      arCondicionadoLigado = valor;
    });
  }

  void alternarIluminacao(bool valor) {
    setState(() {
      iluminacaoLigada = valor;
    });
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  void _showConfigDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Configurar Desligamento Automático'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text('Hora de Início'),
                    trailing: IconButton(
                      icon: Icon(Icons.access_time),
                      onPressed: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            startTime = picked;
                          });
                        }
                      },
                    ),
                    subtitle: Text(startTime != null ? startTime!.format(context) : 'Não definido'),
                  ),
                  ListTile(
                    title: Text('Hora de Término'),
                    trailing: IconButton(
                      icon: Icon(Icons.access_time),
                      onPressed: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            endTime = picked;
                          });
                        }
                      },
                    ),
                    subtitle: Text(endTime != null ? endTime!.format(context) : 'Não definido'),
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
        title: Text('Controle Inteligente de Dispositivos'),
        backgroundColor: Colors.green[50], 
        elevation: 0, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchListTile(
              title: Text('Ar-Condicionado'),
              subtitle: Text(arCondicionadoLigado ? 'Ligado' : 'Desligado'),
              value: arCondicionadoLigado,
              onChanged: alternarArCondicionado,
              secondary: Icon(Icons.ac_unit),
            ),
            SwitchListTile(
              title: Text('Iluminação'),
              subtitle: Text(iluminacaoLigada ? 'Ligada' : 'Desligada'),
              value: iluminacaoLigada,
              onChanged: alternarIluminacao,
              secondary: Icon(Icons.lightbulb),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showConfigDialog,
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
                'Configurar Desligamento Automático',
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
