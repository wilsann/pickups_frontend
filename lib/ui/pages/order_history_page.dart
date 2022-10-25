part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
      if (state is TransactionLoaded) {
        if (state.transactions.isEmpty) {
          return IllustrationPage(
              title: 'Wah! Riwayat Kosong',
              subtitle: 'Sepertinya kamu belum\nbuang sampah hari ini',
              picturePath: 'assets/oops.png',
              buttonTitle1: 'Buang Sampah',
              buttonTap1: () {
                Get.to(TrashCategoryPage());
              });
        } else {
          double listItemWidth =
              MediaQuery.of(context).size.width - 2 * defaultMargin;

          return RefreshIndicator(
            onRefresh: () async {
              await context.read<TransactionCubit>().getTransactions();
            },
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      ////HEADER
                      height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Penjemputan',
                            style: titleTextStyle,
                          ),
                          Text(
                            'Tunggu penjemputanmu',
                            style: greyTextStyle.copyWith(
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                    ////BODY
                    Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          children: [
                            CustomTabBar(
                              titles: ['Di Proses', 'Selesai'],
                              selectedIndex: selectedIndex,
                              onTap: (index) {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Builder(builder: (context) {
                              List<Transaction> transactions = (selectedIndex ==
                                      0)
                                  ? state.transactions
                                      .where((element) =>
                                          element.status ==
                                              TransactionStatus.on_process ||
                                          element.status ==
                                              TransactionStatus.pending)
                                      .toList()
                                  : state.transactions
                                      .where((element) =>
                                          element.status ==
                                              TransactionStatus.done ||
                                          element.status ==
                                              TransactionStatus.cancelled)
                                      .toList();

                              return Column(
                                children: transactions
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.only(
                                              right: defaultMargin,
                                              left: defaultMargin,
                                              bottom: 16),
                                          child: GestureDetector(
                                            onTap: () async {
                                              if (e.status ==
                                                  TransactionStatus.pending) {
                                                await launchUrl(
                                                    Uri.parse(e.paymentUrl));
                                              }
                                            },
                                            child: OrderListItem(
                                              transaction: e,
                                              itemWidth: listItemWidth,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              );
                            }),
                            SizedBox(
                              height: 60,
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ),
          );
        }
      } else {
        return Center(
          child: loadingIndicator,
        );
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
