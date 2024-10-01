import 'package:flutter/material.dart';

void main() {
  runApp(const ConvertisseurApp());
}

class ConvertisseurApp extends StatelessWidget {
  const ConvertisseurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConvertisseurHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ConvertisseurHome extends StatefulWidget {
  const ConvertisseurHome({super.key});

  @override
  _ConvertisseurHomeState createState() => _ConvertisseurHomeState();
}

class _ConvertisseurHomeState extends State<ConvertisseurHome> {
  String _selectedConversion = "EuroToDinar";
  final TextEditingController _controller = TextEditingController();
  double _resultat = 0.0;

  void _convertir() {
    setState(() {
      double? montant = double.tryParse(_controller.text);
      if (montant == null || montant <= 0) {
        _resultat = 0.0;
        return;
      }

      if (_selectedConversion == "EuroToDinar") {
        _resultat = montant * 3.4; 
      } else {
        _resultat = montant / 3.4; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TP1 App"),
        backgroundColor: const Color.fromARGB(255, 219, 187, 225),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Montant",
                  border: OutlineInputBorder(),
                  hintText: 'Entrez le montant à convertir',
                ),
              ),
              const SizedBox(height: 20),
              RadioListTile<String>(
                title: const Text("Dinar ➡ Euro"),
                value: "DinarToEuro",
                groupValue: _selectedConversion,
                onChanged: (String? value) {
                  setState(() {
                    _selectedConversion = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text("Euro ➡ Dinar"),
                value: "EuroToDinar",
                groupValue: _selectedConversion,
                onChanged: (String? value) {
                  setState(() {
                    _selectedConversion = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                "Le résultat est ${_resultat.toStringAsFixed(3)} dinars.",
                style: const TextStyle(
                  color: Color.fromARGB(255, 243, 233, 174),
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertir,
                child: const Text("CONVERTIR"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 178, 209, 224),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
