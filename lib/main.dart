import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:intl/intl.dart';
import 'dart:async';
import 'scheduleselector.dart';

void main() {
  tzdata.initializeTimeZones();
  String timeZoneName = 'America/Argentina/Buenos_Aires';
  var location = tz.getLocation(timeZoneName);
  var now = tz.TZDateTime.now(location);
  var formattedTime =
  DateFormat.Hms().format(now); // Formato horas:minutos:segundos
  print('Hora actual en tu zona horaria: $formattedTime');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RestaurantApp',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          // Establece el color de fondo de la barra de navegación
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: MyHomePage(
        title: 'RestaurantApp',
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/form': (context) => ScheduleSelector(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title = ''});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    updateClock();
  }

  void updateClock() {
    tzdata.initializeTimeZones();
    String timeZoneName = 'America/Argentina/Buenos_Aires';
    var location = tz.getLocation(timeZoneName);
    var now = tz.TZDateTime.now(location);
    setState(() {
      currentTime = DateFormat.Hms().format(now);
    });

    // Schedule the next update after 1 second
    Timer(Duration(seconds: 1), updateClock);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/asado.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.transparent,
                child: Row(
                  children: [
                    Text(
                      'Restaurant App',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Asados\nArgentinos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 15.0,
                              color: Colors.black,
                              offset: Offset(20.0, 3.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 200, // Define el ancho del botón
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScheduleSelector(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.brown),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Ir a la Carta',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
              'Hora Actual:',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 5),
            Card(
              elevation: 5,
              color: Colors.brown,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    currentTime,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    )
    );
  }
}
