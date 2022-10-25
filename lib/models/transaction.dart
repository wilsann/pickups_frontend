part of 'models.dart';

enum TransactionStatus {
  done,
  on_process,
  pending,
  cancelled,
}

class Transaction extends Equatable {
  final int id;
  final User user;
  final Trash trash;
  final int quantity;
  final int total;
  final TransactionStatus status;
  final String paymentUrl;
  DateTime dateTime;

  Transaction({
    this.id,
    this.user,
    this.trash,
    this.quantity,
    this.total,
    this.status,
    this.paymentUrl,
    this.dateTime,
  });

  factory Transaction.fromJson(Map<String, dynamic> data) => Transaction(
      id: data['id'],
      trash: Trash.fromJson(data['trash']),
      quantity: data['quantity'],
      total: data['total'],
      status: (data['status'] == 'PENDING')
          ? TransactionStatus.pending
          : (data['status'] == 'DONE')
              ? TransactionStatus.done
              : (data['status'] == 'CANCELLED')
                  ? TransactionStatus.cancelled
                  : TransactionStatus.on_process,
      paymentUrl: data['payment_url'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(data['created_at']));

  Transaction copyWith({
    int id,
    User user,
    Trash trash,
    int quantity,
    int total,
    TransactionStatus status,
    DateTime dateTime,
  }) {
    return Transaction(
      id: id ?? this.id,
      user: user ?? this.user,
      trash: trash ?? this.trash,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      status: status ?? this.status,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object> get props =>
      [id, user, trash, quantity, total, status, dateTime];
}

List<Transaction> mockTransactions = [
  Transaction(
    id: 1,
    user: mockUser,
    trash: mockTrash[1],
    quantity: 2,
    total: (mockTrash[1].price * 2 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.on_process,
  ),
  Transaction(
    id: 1,
    user: mockUser,
    trash: mockTrash[1],
    quantity: 2,
    total: (mockTrash[1].price * 2 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.done,
  ),
  Transaction(
    id: 1,
    user: mockUser,
    trash: mockTrash[1],
    quantity: 2,
    total: (mockTrash[1].price * 2 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.cancelled,
  )
];
