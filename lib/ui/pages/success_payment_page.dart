part of 'pages.dart';

class SuccessPaymentPage extends StatelessWidget {
  const SuccessPaymentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: 'Pembayaran berhasil!',
        subtitle:
            "Kamu sudah ikut serta untuk\nmenjaga lingkungan tetap sehat.",
        picturePath: 'assets/success_payment.png',
        buttonTap1: () {
          Get.offAll(MainPage());
        },
        buttonTitle1: 'Lanjutkan',
        buttonTap2: () {
          Get.offAll(MainPage(
            initialPage: 1,
          ));
        },
        buttonTitle2: 'Lihat pegajuan',
      ),
    );
  }
}
