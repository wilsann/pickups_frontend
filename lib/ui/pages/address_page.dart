part of 'pages.dart';

class AddressPage extends StatefulWidget {
  Key key;
  final User user;
  final String password;
  final File pictureFile;

  AddressPage(this.user, this.password, this.pictureFile);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

// var currentSelectedValue;
// const cityChoice = ["Bekasi", "Jakarta"];

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();
  bool isLoading = false;
  List<String> cities;
  String selectedCity;

  @override
  void initState() {
    super.initState();

    cities = ['Bekasi', 'Jakarta'];
    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Alamat',
      subtitle: 'Selamat bergabung!',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 6),
            child: Text(
              "Nomor Telepon",
              style: formTextStyle,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyTextStyle,
                  hintText: "Masukkan nomor telepon"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 6),
            child: Text(
              "Alamat",
              style: formTextStyle,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyTextStyle,
                  hintText: "Masukkan alamat lengkap"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: Text(
              "Nomor Rumah",
              style: formTextStyle,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: houseNumController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyTextStyle,
                  hintText: "Masukkan nomor rumah"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: Text(
              "Kota",
              style: formTextStyle,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: DropdownButton(
              value: selectedCity,
              isExpanded: true,
              underline: SizedBox(),
              items: cities
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: menuTextStyle,
                      )))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  selectedCity = item;
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: (isLoading == true)
                ? Center(
                    child: loadingIndicator,
                  )
                : ElevatedButton(
                    onPressed: () async {
                      User user = widget.user.copyWith(
                          phoneNumber: phoneController.text,
                          address: addressController.text,
                          houseNumber: houseNumController.text,
                          city: selectedCity);

                      setState(() {
                        isLoading = true;
                      });

                      await context.read<UserCubit>().signUp(
                          user, widget.password,
                          pictureFile: widget.pictureFile);

                      UserState state = context.read<UserCubit>().state;

                      if (state is UserLoaded) {
                        context.read<TrashCubit>().getTrash();
                        context.read<TransactionCubit>().getTransactions();
                        Get.to(MainPage());
                      } else {
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: "D9435E".toColor(),
                          icon: Icon(
                            Icons.cloud_circle_outlined,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Gagal masuk",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          messageText: Text(
                            (state as UserLoadingFailed).message,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        );
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: (mainColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      'Daftar Sekarang',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
