import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: { //ez egy map, key-value párokkal
      '/': (context) => Loading(), //ez a base route
      '/home': (context) => Home(), //mi fog megjelenni a home képernyőn
      '/location': (context) => ChooseLocation(), //a context elárulja, hol tartunk éppen a widget fában
    },
  ));



