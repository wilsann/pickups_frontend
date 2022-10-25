part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final title;
  final subtitle;
  final picturePath;
  final buttonTitle1;
  final buttonTitle2;
  final buttonTap2;
  final VoidCallback buttonTap1;

  const IllustrationPage({
    Key key,
    this.title,
    this.subtitle,
    this.picturePath,
    this.buttonTitle1,
    this.buttonTitle2,
    this.buttonTap1,
    this.buttonTap2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 350,
            height: 350,
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(picturePath))),
          ),
          Text(title, style: titleTextStyle.copyWith(fontSize: 20)),
          Text(
            subtitle,
            style: subtitleTextStyle.copyWith(fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 12),
            width: 200,
            height: 45,
            child: ElevatedButton(
              onPressed: buttonTap1,
              style: ElevatedButton.styleFrom(
                  primary: (mainColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text(
                buttonTitle1,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          (buttonTap2 == null)
              ? SizedBox()
              : SizedBox(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: buttonTap2,
                    style: ElevatedButton.styleFrom(
                        primary: '8D92A3'.toColor(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      buttonTitle2 ?? 'title',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
