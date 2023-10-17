import 'package:flutter/material.dart';
import 'package:moda_app/pages/home_page.dart';
import 'package:moda_app/utils/text.dart';

import '../utils/config.dart';

class DetailPage extends StatefulWidget {
  final imgPath;
  const DetailPage({this.imgPath, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Container(
            height: 37,
            width: 37,
            decoration: BoxDecoration(
                borderRadius: Config.borderRadius35, color: Colors.white70),
            child: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Hero(
            tag: widget.imgPath,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imgPath), fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            bottom: 15,
            child: Material(
              borderRadius: Config.borderRadius10,
              elevation: 5,
              child: Container(
                height: 240,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: Config.borderRadius10,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: Config.borderRadius10,
                              border: Border.all(color: Colors.grey),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/dress.jpg"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppText.enText["detail_title"]!,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Config.spaceSmallH,
                            Row(
                              children: [
                                Text(
                                  AppText.enText["detail_brand"]!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                Config.spaceMediumW,
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    borderRadius: Config.borderRadius10,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/louisvuitton.jpg"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Config.spaceMediumH,
                            SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width - 200,
                              child: Text(
                                AppText.enText["detail_explanation"]!,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppText.enText["detail_price"]!,
                            style: const TextStyle(fontSize: 22),
                          ),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: FloatingActionButton(
                              elevation: 0,
                              onPressed: () {},
                              child: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
