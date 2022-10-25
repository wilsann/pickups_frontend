part of 'widgets.dart';

class TrashListItem extends StatelessWidget {
  final Trash trash;
  final double itemWidth;

  TrashListItem({@required this.trash, @required this.itemWidth});

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
                  image: NetworkImage(trash.picturePath), fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trash.name,
                style: menuTextStyle,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                NumberFormat.currency(
                        symbol: 'RP ', decimalDigits: 0, locale: 'id-ID')
                    .format(trash.price),
                style: greyTextStyle.copyWith(fontSize: 13),
              ),
            ],
          ),
        )
      ],
    );
  }
}
