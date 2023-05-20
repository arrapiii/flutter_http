import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future getApi() async {
  Response response =
      await get(Uri.parse("https://komiku-api.fly.dev/api/comic/info/manga/one-piece/"));
      return jsonDecode(response.body);
}
