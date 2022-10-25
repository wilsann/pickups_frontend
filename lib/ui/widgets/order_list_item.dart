part of 'widgets.dart';

class OrderListItem extends StatefulWidget {
  final Transaction transaction;
  final double itemWidth;

  OrderListItem({@required this.transaction, this.itemWidth});

  @override
  State<OrderListItem> createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(widget.transaction.trash.picturePath),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: widget.itemWidth - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.transaction.trash.name,
                style: menuTextStyle,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                "${widget.transaction.quantity} item(s) • " +
                    NumberFormat.currency(
                            symbol: 'RP ', decimalDigits: 0, locale: 'id-ID')
                        .format(widget.transaction.total),
                style: greyTextStyle.copyWith(fontSize: 13),
              )
            ],
          ),
        ),
        SizedBox(
          width: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${DateFormat.yMMMMd().format(widget.transaction.dateTime)}",
                // convertDateTime(widget.transaction.dateTime),
                //
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
              (widget.transaction.status == TransactionStatus.cancelled)
                  ? Text(
                      'Cancelled',
                      style:
                          GoogleFonts.poppins(color: Colors.red, fontSize: 10),
                    )
                  : (widget.transaction.status == TransactionStatus.pending)
                      ? Text(
                          'Pending',
                          style: GoogleFonts.poppins(
                              color: Colors.red, fontSize: 10),
                        )
                      : (widget.transaction.status ==
                              TransactionStatus.on_process)
                          ? Text(
                              'Di Proses',
                              style: GoogleFonts.poppins(
                                  color: Colors.greenAccent[400], fontSize: 10),
                            )
                          : SizedBox()
            ],
          ),
        )
      ],
    );
  }

  // String convertDateTime(DateTime dateTime) {
  //   String month;

  //   switch (dateTime.month) {
  //     case 1:
  //       month = 'Jan';
  //       break;
  //     case 2:
  //       month = 'Feb';
  //       break;
  //     case 3:
  //       month = 'Mar';
  //       break;
  //     case 4:
  //       month = 'Apr';
  //       break;
  //     case 5:
  //       month = 'May';
  //       break;
  //     case 6:
  //       month = 'Jun';
  //       break;
  //     case 7:
  //       month = 'Jul';
  //       break;
  //     case 8:
  //       month = 'Aug';
  //       break;
  //     case 9:
  //       month = 'Sep';
  //       break;
  //     case 10:
  //       month = 'Oct';
  //       break;
  //     case 11:
  //       month = 'Nov';
  //       break;
  //     default:
  //       month = 'Des';
  //   }

  //   return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  // }
}
