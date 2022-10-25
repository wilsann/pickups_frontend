part of 'pages.dart';

class TrashDetailPage extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;
  final Trash trash;

  TrashDetailPage({this.onBackButtonPressed, this.transaction, this.trash});
  @override
  State<TrashDetailPage> createState() => _TrashDetailPageState();
}

class _TrashDetailPageState extends State<TrashDetailPage> {
  DateTime selectedDate = DateTime.now();
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          SafeArea(
              child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(widget.transaction.trash.picturePath),
              fit: BoxFit.cover,
            )),
          )),
          SafeArea(
              child: ListView(
            children: [
              Column(
                children: [
                  /// Back Button
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          if (widget.onBackButtonPressed != null) {
                            widget.onBackButtonPressed();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black12),
                          child: Image.asset('assets/back_arrow_white.png'),
                        ),
                      ),
                    ),
                  ),

                  ///Body
                  Container(
                    margin: EdgeInsets.only(top: 180),
                    padding: EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 134,
                                  child: Text(
                                    widget.transaction.trash.name,
                                    style: menuTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity = max(1, quantity - 1);
                                    });
                                  },
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(width: 1),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/btn_min.png'))),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                  child: Text(
                                    quantity.toString(),
                                    textAlign: TextAlign.center,
                                    style: menuTextStyle,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity = min(999, quantity + 1);
                                    });
                                  },
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(width: 1),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/btn_add.png'))),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                          child: Text(
                            widget.transaction.trash.description,
                            style: greyTextStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dijemput pada:',
                                  style: greyTextStyle.copyWith(fontSize: 13),
                                ),
                                Text(
                                  DateFormat.yMMMMd().format(selectedDate),
                                  style: menuTextStyle.copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 163,
                              height: 40,
                              child: OutlinedButton(
                                onPressed: () {
                                  showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2022),
                                      lastDate: DateTime(2025),
                                      selectableDayPredicate: (day) {
                                        if ((day.isAfter(DateTime.now()
                                            .subtract(Duration(days: 1))))) {
                                          return true;
                                        }
                                        return false;
                                      }).then((value) {
                                    if (value != null)
                                      setState(() {
                                        selectedDate = value;
                                      });
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  primary: mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Text(
                                  'Pilih tanggal',
                                  style: greyTextStyle.copyWith(
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Harga:',
                                  style: greyTextStyle.copyWith(fontSize: 13),
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(quantity *
                                          widget.transaction.trash.price),
                                  style: menuTextStyle.copyWith(fontSize: 18),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 163,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(PaymentPage(
                                    transaction: widget.transaction.copyWith(
                                        quantity: quantity,
                                        dateTime: selectedDate,
                                        total: quantity *
                                            widget.transaction.trash.price),
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: (mainColor),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Text(
                                  'Pesan Sekarang',
                                  style: menuTextStyle.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
