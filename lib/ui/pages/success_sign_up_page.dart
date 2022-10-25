part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  const SuccessSignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
          title: 'Selamat bergabung!',
          subtitle:
              "Kamu sudah bergabung untuk\nmenjaga lingkungan tetap sehat.",
          picturePath: 'assets/success_order.png',
          buttonTitle1: 'Lanjutkan',
          buttonTap1: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          }),
    );
  }
}
