import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bioquímica POC',
      debugShowCheckedModeBanner: false,
      home: BioquimicaForm(),
    );
  }
}

class BioquimicaForm extends StatefulWidget {
  @override
  _BioquimicaFormState createState() => _BioquimicaFormState();
}

class _BioquimicaFormState extends State<BioquimicaForm> {
  // Variables para guardar los resultados seleccionados
  String tsiResult = 'A/A';
  String gas = '+';
  String h2s = '-';
  String liaResult = 'K/K';
  String motility = '+';
  String indol = '+';
  String ornithine = '+';

  // Función para determinar el microorganismo
  String determineMicroorganism() {
    if (tsiResult == 'A/A' && gas == '+' && h2s == '-' && liaResult == 'K/K' && motility == '+' && indol == '+' && ornithine == '+') {
      return 'Escherichia coli';
    }
    // Puedes agregar más reglas aquí para otros microorganismos.
    return 'Microorganismo no identificado';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba de Concepto Bioquímica'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Dropdown para TSI
            Text('TSI:'),
            DropdownButton<String>(
              value: tsiResult,
              onChanged: (String? newValue) {
                setState(() {
                  tsiResult = newValue!;
                });
              },
              items: <String>['A/A', 'K/K', 'A/K'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            // Dropdown para Gas
            Text('Producción de Gas:'),
            DropdownButton<String>(
              value: gas,
              onChanged: (String? newValue) {
                setState(() {
                  gas = newValue!;
                });
              },
              items: <String>['+', '-'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            // Dropdown para H2S
            Text('Producción de H2S:'),
            DropdownButton<String>(
              value: h2s,
              onChanged: (String? newValue) {
                setState(() {
                  h2s = newValue!;
                });
              },
              items: <String>['+', '-'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            // Dropdown para LIA
            Text('LIA:'),
            DropdownButton<String>(
              value: liaResult,
              onChanged: (String? newValue) {
                setState(() {
                  liaResult = newValue!;
                });
              },
              items: <String>['K/K', 'A/A'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            // Dropdown para Motilidad
            Text('Motilidad:'),
            DropdownButton<String>(
              value: motility,
              onChanged: (String? newValue) {
                setState(() {
                  motility = newValue!;
                });
              },
              items: <String>['+', '-'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            // Dropdown para Indol
            Text('Indol:'),
            DropdownButton<String>(
              value: indol,
              onChanged: (String? newValue) {
                setState(() {
                  indol = newValue!;
                });
              },
              items: <String>['+', '-'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            // Dropdown para Ornitina
            Text('Ornitina:'),
            DropdownButton<String>(
              value: ornithine,
              onChanged: (String? newValue) {
                setState(() {
                  ornithine = newValue!;
                });
              },
              items: <String>['+', '-'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            // Botón de procesar
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String microorganism = determineMicroorganism();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Microorganismo Identificado'),
                        content: Text(microorganism),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Procesar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
