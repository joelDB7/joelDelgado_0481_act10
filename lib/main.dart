import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
      ),
      home: const AlarmPage(),
    );
  }
}

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  // Datos de ejemplo basados en tu dibujo
  List<Map<String, dynamic>> alarms = [
    {'time': '10:30 am', 'title': 'Ibuprofeno', 'isActive': true},
    {'time': '11:00 pm', 'title': 'Agregar nombre', 'isActive': true},
    {'time': '08:10 am', 'title': 'Agregar nombre', 'isActive': false},
  ];

  void handleMenuSelection(String value) {
    // Aquí puedes manejar lo que sucede cuando se selecciona una opción
    print("Selected: $value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9E3D0), // Color verdoso de tu fondo
      appBar: AppBar(
        title: const Text(
          'A Tiempo',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: const Color(0xFFC4A484), // Color café de tu dibujo
        elevation: 0,
        automaticallyImplyLeading: false, // No mostrar el botón de retroceso
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: Colors.black),
            onSelected: handleMenuSelection,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'contacto',
                child: ListTile(
                  leading: Icon(Icons.contact_phone),
                  title: Text('Contacto'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'config_alarma',
                child: ListTile(
                  leading: Icon(Icons.alarm),
                  title: Text('Configuración de Alarma'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'add_alarma',
                child: ListTile(
                  leading: Icon(Icons.add_alarm),
                  title: Text('Agregar Alarma'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // --- Lista de Alarmas ---
            Expanded(
              child: ListView.builder(
                itemCount: alarms.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Etiqueta superior del botón (Nombre del medicamento)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(alarms[index]['title']),
                        ),
                        const SizedBox(height: 5),
                        // Caja de la Alarma con el Switch
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                alarms[index]['time'],
                                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                              ),
                              // El botón deslizante que pediste
                              Switch(
                                value: alarms[index]['isActive'],
                                activeTrackColor: Colors.black,
                                onChanged: (bool value) {
                                  setState(() {
                                    alarms[index]['isActive'] = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // --- Barra de navegación inferior ---
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                color: Color(0xFFC4A484), // Color café de tu dibujo
                border: Border(top: BorderSide(color: Colors.black, width: 2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('hora', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('día', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Icon(Icons.hourglass_empty, size: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}