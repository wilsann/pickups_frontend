part of 'pages.dart';

class TrashPage extends StatefulWidget {
  const TrashPage({Key key}) : super(key: key);

  @override
  State<TrashPage> createState() => _TrashPageState();
}

class _TrashPageState extends State<TrashPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            ///HEADER
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PickUps',
                        style: titleTextStyle,
                      ),
                      Text(
                        'Yuk, jaga lingkungan!',
                        style:
                            greyTextStyle.copyWith(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  InkWell(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage((context
                                      .read<UserCubit>()
                                      .state as UserLoaded)
                                  .user
                                  .picturePath),
                              fit: BoxFit.cover)),
                    ),
                    onTap: () {
                      Get.to(ProfilePage());
                    },
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: SizedBox(
                      width: double.infinity,
                      height: 600,
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .80,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: [
                          MenuCard(
                            title: 'Pengajuan Penjemputan',
                            svgSrc: 'assets/Jemput.svg',
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  UserState state =
                                      context.read<UserCubit>().state;
                                  if (state is UserLoaded) {
                                    context.read<TrashCubit>().getTrash();
                                    context
                                        .read<TransactionCubit>()
                                        .getTransactions();
                                  }
                                  return TrashCategoryPage();
                                }),
                              );
                            },
                          ),
                          MenuCard(
                              title: 'Chat Kami',
                              svgSrc: 'assets/chats.svg',
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return ChatPage();
                                  }),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///LIST
            // Container(
            //   width: double.infinity,
            //   color: Colors.white,
            //   child: Column(
            //     children: [
            //       CustomTabBar(
            //         titles: ['Di Proses', 'Selesai'],
            //         selectedIndex: selectedIndex,
            //         onTap: (index) {
            //           selectedIndex = index;
            //         },
            //       ),
            //       SizedBox(
            //         height: 16,
            //       ),
            //       Builder(builder: (_) {
            //         String body =
            //             (selectedIndex == 0) ? 'Di Proses' : 'Selesai';

            //         return Center(
            //           child: Text(
            //             body,
            //             style: menuTextStyle,
            //           ),
            //         );
            //       })
            //     ],
            //   ),
            // )
          ],
        ),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final VoidCallback press;
  const MenuCard({
    Key key,
    this.svgSrc,
    this.press,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        width: 200,
        height: 210,
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Spacer(),
                  SvgPicture.asset(
                    svgSrc,
                    height: 100,
                  ),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
