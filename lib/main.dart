import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mapa do Thico",
      debugShowCheckedModeBanner: false,
      home: MapPage(),
    );
  }
}

class MapPage extends StatelessWidget {
  MapPage({super.key});

  final LatLng senacLapaTito = LatLng(-23.52813, -46.699746);
  final LatLng comunidadeImirim = LatLng(-23.49587, -46.63398);
  final LatLng casaCanaa = LatLng(-23.10, -46.55);
  final LatLng casaRuaJoaoMoreno155 = LatLng(-23.4700382, -46.6757517);

  final String mapaUrl = "https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png";

  @override
  Widget build(BuildContext context) {
    double avgLat = (senacLapaTito.latitude + comunidadeImirim.latitude + casaCanaa.latitude + casaRuaJoaoMoreno155.latitude) / 4;
    double avgLng = (senacLapaTito.longitude + comunidadeImirim.longitude + casaCanaa.longitude + casaRuaJoaoMoreno155.longitude) / 4;

    return Scaffold(
      appBar: AppBar(title: const Text("Mapa do Thico")),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(avgLat, avgLng),
          initialZoom: 11,
        ),
        children: [
          TileLayer(urlTemplate: mapaUrl),
          MarkerLayer(markers: [

            Marker(
              point: senacLapaTito,
              width: 80,
              height: 80,
              child: Column(children: [
                const Icon(Icons.school, size: 36, color: Colors.blue),
                Container(
                  padding: const EdgeInsets.all(3),
                  color: Colors.white,
                  child: const Text("Senac Lapa Tito", style: TextStyle(fontSize: 12), textAlign: TextAlign.center),
                )
              ]),
            ),

            Marker(
              point: comunidadeImirim,
              width: 100,
              height: 80,
              child: Column(children: [
                const Icon(Icons.church, size: 36, color: Colors.green),
                Container(
                  padding: const EdgeInsets.all(3),
                  color: Colors.white,
                  child: const Text("Comunidade Fé Esperança e Amor", style: TextStyle(fontSize: 10), textAlign: TextAlign.center),
                )
              ]),
            ),

            Marker(
              point: casaCanaa,
              width: 100,
              height: 80,
              child: Column(children: [
                const Icon(Icons.home, size: 36, color: Colors.red),
                Container(
                  padding: const EdgeInsets.all(3),
                  color: Colors.white,
                  child: const Text("Casa de Conversão Cannã", style: TextStyle(fontSize: 10), textAlign: TextAlign.center),
                )
              ]),
            ),

            Marker(
              point: casaRuaJoaoMoreno155,
              width: 90,
              height: 80,
              child: Column(children: [
                const Icon(Icons.house, size: 36, color: Colors.purple),
                Container(
                  padding: const EdgeInsets.all(3),
                  color: Colors.white,
                  child: const Text("Casa", style: TextStyle(fontSize: 10), textAlign: TextAlign.center),
                )
              ]),
            ),

          ])
        ],
      ),
    );
  }
}
