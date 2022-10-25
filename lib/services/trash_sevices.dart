part of 'services.dart';

class TrashServices {
  static Future<ApiReturnValue<List<Trash>>> getTrash(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'trash';

    var response = await client.get(Uri.parse(url),
        headers: {"Connection": "Keep-Alive", "Cache-Control": "no-cache"});

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Mohon dicoba lagi');
    }

    var data = jsonDecode(response.body);

    List<Trash> trash = (data['data']['data'] as Iterable)
        .map((e) => Trash.fromJson(e))
        .toList();

    return ApiReturnValue(value: trash);
  }
}
