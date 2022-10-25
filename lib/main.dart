import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickup_apps/cubit/transaction_cubit.dart';
import 'package:pickup_apps/cubit/trash_cubit.dart';
import 'package:pickup_apps/cubit/user_cubit.dart';
import 'package:pickup_apps/models/models.dart';
import 'ui/pages/pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => UserCubit()),
          BlocProvider(create: (_) => TrashCubit()),
          BlocProvider(create: (_) => TransactionCubit()),
        ],
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false, home: SignInPage()));
  }
}

// PaymentPage(
//             transaction: Transaction(
//                 trash: mockTrash[0],
//                 user: mockUser,
//                 quantity: 2,
//                 total: mockTrash[1].price * 2),
//           ),

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
