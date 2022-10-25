import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pickup_apps/main.dart';
import 'package:pickup_apps/models/models.dart';
import 'package:http/http.dart' as http;

part 'user_services.dart';
part 'trash_sevices.dart';
part 'transaction_services.dart';

String baseURL = 'http://192.168.1.8:8000/api/';
