part of 'pages.dart';

class TrashCategoryPage extends StatefulWidget {
  const TrashCategoryPage({Key key}) : super(key: key);

  @override
  State<TrashCategoryPage> createState() => TrashCategoryPageState();
}

class TrashCategoryPageState extends State<TrashCategoryPage> {
  // List<Trash> list = [];
  // void getListAPI() {
  //   Trash.getTrash().then((hasil) {
  //     list = hasil;
  //   });
  // }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrashCubit, TrashState>(builder: (context, state) {
      if (state is TrashLoaded) {
        double listItemWidth =
            MediaQuery.of(context).size.width - 2 * defaultMargin;
        return Scaffold(
          body: ListView(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
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
                            'Pengajuan',
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
                    SizedBox(
                      height: 16,
                    ),
                    BlocBuilder<TrashCubit, TrashState>(builder: (_, state) {
                      if (state is TrashLoaded) {
                        List<Trash> trashes = state.trash.toList();

                        // (selectedIndex == 0)
                        //     ? mockTrash
                        //     : (selectedIndex == 1)
                        //         ? []
                        //         : [];

                        return Column(
                          children: trashes
                              .map((e) => Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      defaultMargin, 0, defaultMargin, 16),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(TrashDetailPage(
                                        transaction: Transaction(
                                            trash: e,
                                            user: (context
                                                    .read<UserCubit>()
                                                    .state as UserLoaded)
                                                .user),
                                      ));
                                    },
                                    child: TrashListItem(
                                        trash: e, itemWidth: listItemWidth),
                                  )
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     Get.to(TrashDetailPage(
                                  //       transaction: Transaction(
                                  //           trash: e,
                                  //           user: (context.read<UserCubit>().state
                                  //                   as UserLoaded)
                                  //               .user),
                                  //       onBackButtonPressed: () {
                                  //         Get.back();
                                  //       },
                                  //     ));
                                  //   },
                                  //   child: TrashListItem(
                                  //       trash: e, itemWidth: listItemWidth),
                                  // ),
                                  ))
                              .toList(),
                        );
                      }
                      return Center(child: loadingIndicator);
                    }),
                  ],
                ),
              ),
            ],
          ),
        );
      }
      return Center(
        child: loadingIndicator,
      );
    });
  }
}
