import 'package:flutter/material.dart';
import 'package:moda_app/pages/detail_page.dart';
import 'package:moda_app/utils/text.dart';

import '../utils/config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(
        indicatorColor: Colors.transparent,
        controller: tabController,
        tabs: [
          tabBarItem(Icons.more),
          tabBarItem(Icons.play_arrow),
          tabBarItem(Icons.navigation),
          tabBarItem(Icons.supervised_user_circle),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppText.enText["title_text"]!,
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
            color: Colors.grey,
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [
          SizedBox(
            height: 140,
            width: double.infinity,
            child: ListView(
              padding: const EdgeInsets.only(top: 10, left: 10),
              scrollDirection: Axis.horizontal,
              children: [
                //Üst taraftaki profil listesi
                profileListElements("assets/images/model1.jpeg",
                    "assets/images/chanellogo.jpg"),
                Config.spaceMediumW,
                profileListElements(
                    "assets/images/model2.jpeg", "assets/images/chloelogo.png"),
                Config.spaceMediumW,
                profileListElements("assets/images/model3.jpeg",
                    "assets/images/louisvuitton.jpg"),
                Config.spaceMediumW,
                profileListElements("assets/images/model1.jpeg",
                    "assets/images/chanellogo.jpg"),
                Config.spaceMediumW,
                profileListElements("assets/images/model2.jpeg",
                    "assets/images/chanellogo.jpg"),
                Config.spaceMediumW,
                profileListElements("assets/images/model3.jpeg",
                    "assets/images/chanellogo.jpg"),
                Config.spaceMediumW,
                profileListElements("assets/images/model1.jpeg",
                    "assets/images/chanellogo.jpg"),
                Config.spaceMediumW,
                profileListElements("assets/images/model2.jpeg",
                    "assets/images/chanellogo.jpg"),
                Config.spaceMediumW,
                profileListElements("assets/images/model3.jpeg",
                    "assets/images/chanellogo.jpg"),
              ],
            ),
          ),
          //*****  KART *****//
          Padding(
            padding: const EdgeInsets.all(16),
            child: Material(
              borderRadius: Config.borderRadius16,
              elevation: 5,
              child: Container(
                height: 485,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: Config.borderRadius35,
                            image: const DecorationImage(
                                image: AssetImage("assets/images/model1.jpeg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Config.spaceMediumW,
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppText.enText["name_text"]!,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Config.spaceSmallH,
                              Text(
                                AppText.enText["last_seen_text"]!,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                          size: 22,
                        ),
                      ],
                    ),
                    Config.spaceLargeH,
                    Text(
                      AppText.enText["info_text"]!,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Config.spaceLargeH,
                    modelGrids(context),
                    Config.spaceMediumH,
                    Row(
                      children: [
                        hashTag(AppText.enText["louis_vuitton_text"]!, 90),
                        Config.spaceMediumW,
                        hashTag(AppText.enText["chloe_text"]!, 85),
                      ],
                    ),
                    Config.spaceHeight20,
                    const Divider(thickness: 1),
                    Config.spaceHeight20,
                    Row(
                      children: [
                        replyAndComment(Icons.reply, "1.7k"),
                        Config.spaceWidth35,
                        replyAndComment(Icons.comment, "325"),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 235,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 25,
                              ),
                              Config.spaceSmallW,
                              Text(
                                "1.2k",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Tab tabBarItem(IconData icon) {
    return Tab(
      icon: Icon(
        icon,
        color: Colors.grey,
        size: 22,
      ),
    );
  }

  Row replyAndComment(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.brown.withOpacity(0.3),
          size: 25,
        ),
        Config.spaceMediumW,
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Container hashTag(
    String text,
    double witdh,
  ) {
    return Container(
      height: 25,
      width: witdh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.brown.withOpacity(0.2),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 10, color: Colors.brown),
        ),
      ),
    );
  }

  Row modelGrids(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailPage(imgPath: "assets/images/modelgrid1.jpeg"),
                ));
          },
          child: Hero(
            tag: "assets/images/modelgrid1.jpeg",
            child: Container(
              height: 200,
              width: (MediaQuery.of(context).size.width - 50) / 2,
              decoration: BoxDecoration(
                borderRadius: Config.borderRadius5,
                image: const DecorationImage(
                  image: AssetImage("assets/images/modelgrid1.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Config.spaceSmallW,
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        imgPath: "assets/images/modelgrid2.jpeg",
                      ),
                    ));
              },
              child: Hero(
                tag: "assets/images/modelgrid2.jpeg",
                child: Container(
                  height: 95,
                  width: (MediaQuery.of(context).size.width - 100) / 2,
                  decoration: BoxDecoration(
                    borderRadius: Config.borderRadius5,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/modelgrid2.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Config.spaceMediumH,
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        imgPath: "assets/images/modelgrid3.jpeg",
                      ),
                    ));
              },
              child: Hero(
                tag: "assets/images/modelgrid3.jpeg",
                child: Container(
                  height: 95,
                  width: (MediaQuery.of(context).size.width - 100) / 2,
                  decoration: BoxDecoration(
                    borderRadius: Config.borderRadius5,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/modelgrid3.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget profileListElements(String imagePath, String logoPath) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: 45,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(logoPath), fit: BoxFit.cover),
                ),
              ),
            )
          ],
        ),
        Config.spaceMediumH,
        Container(
            height: 30,
            width: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.brown),
            child: const Center(
              child: Text(
                "Follow",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            )),
      ],
    );
  }
}
