part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'transactions';

    var response = await client.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Connection": "Keep-Alive",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Mohon dicoba kembali');
    }

    var data = jsonDecode(response.body);

    List<Transaction> transactions = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();

    debugPrint(response.toString());
    return ApiReturnValue(value: transactions);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction,
      {http.Client client}) async {
    // await Future.delayed(Duration(seconds: 2));

    // return ApiReturnValue(
    //     value: transaction.copyWith(id: 1, status: TransactionStatus.pending));
    client ??= http.Client();

    String url = baseURL + 'checkout';

    var response = await client.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
        body: jsonEncode(<String, dynamic>{
          'user_id': transaction.user.id,
          'trash_id': transaction.trash.id,
          "quantity": transaction.quantity,
          "total": transaction.total,
          "status": "PENDING",
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Mohon dicoba kembali');
    }

    var data = jsonDecode(response.body);

    Transaction value = Transaction.fromJson(data['data']);

    return ApiReturnValue(value: value);
  }
}
