part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  final String paymentURL;
  const PaymentMethodPage({Key key, this.paymentURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: 'Selesaikan Pembayaranmu',
        subtitle: "Pilih metode pembayaran\nfavoritmu.",
        picturePath: 'assets/Payment.png',
        buttonTap1: () async {
          await launchUrl(Uri.parse(paymentURL));
        },
        buttonTitle1: 'Metode Pembayaran',
        buttonTap2: () {
          Get.to(SuccessPaymentPage());
        },
        buttonTitle2: 'Lanjutkan',
      ),
    );
  }
}
