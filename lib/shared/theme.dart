part of 'shared.dart';

Color greyColor = Color(0xff8D8DAA);
Color mainColor = Color(0xff00BFA5);
Color whiteColor = Color(0xffFCFDFE);

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

TextStyle titleTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  fontSize: 25,
);

TextStyle subtitleTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w300,
  color: '8D92A3'.toColor(),
);

TextStyle formTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: Colors.black,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  color: Colors.grey,
);

TextStyle menuTextStyle =
    GoogleFonts.poppins(fontWeight: FontWeight.w500, color: Colors.black);

TextStyle courseTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

const double defaultMargin = 24;
