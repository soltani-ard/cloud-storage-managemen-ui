import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double widthScreen = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    // padding x every side 25
    widthScreen = MediaQuery.of(context).size.width - 50;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            alignment: Alignment.bottomCenter,
            height: 150,
            decoration: BoxDecoration(color: Colors.blue.shade800),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Cloud File Manager',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Team Folder',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                Row(

                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 25,),

          // Storage Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Storage  ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),

                    children: [
                      TextSpan(text: '8.2 / 10 G', style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black, fontSize: 16)),
                    ]
                  ),
                ),
                const Text('Upgrade', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16)),

              ],
            ),
          ),

          const SizedBox(height: 25,),

          // File Size Chart
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildFileSizeChart("Sources", Colors.blue, .3),
                SizedBox(width: widthScreen * 0.02,),
                buildFileSizeChart("Docs", Colors.red, .2),
                SizedBox(width: widthScreen * 0.02,),
                buildFileSizeChart("Images", Colors.yellow, .3),
                SizedBox(width: widthScreen * 0.02,),
                buildFileSizeChart("Other", Colors.grey, .1),
            ],),
          ),

          const SizedBox(height: 15,),
          const Divider(height: 20,),

          // Recently Update
          Expanded(child: ListView(
            padding: const EdgeInsets.all(25),
            children: [
            const Text("Recently Update", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black, ),),
              const SizedBox(height: 15,),
              Row(
                children: [
                  buildFileColumn("sketch.png", "Desktop", ".sketch"),
                  SizedBox(width: widthScreen * 0.03,),
                  buildFileColumn("sketch.png", "Mobile", ".sketch"),
                  SizedBox(width: widthScreen * 0.03,),
                  buildFileColumn("prd.png", "Interaction", ".prd"),
                ],
              ),
              const Divider(height: 60,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Projects", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                  Text("Create New", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),),
                ],
              ),
              const SizedBox(height: 15,),
              buildRowProjects("ChatBox"),
              buildRowProjects("TimeNote"),
              buildRowProjects("Something"),
              buildRowProjects("Other"),
          ],)),

        ],
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.white, spreadRadius: 7, blurRadius: 1),
          ]
        ),
        child: FloatingActionButton(
          onPressed: (){},
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Time'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Folder'),
        ],
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }

  Container buildRowProjects(String folderName) {
    return Container(
              height: 65,
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(children: [
                  Icon(Icons.folder, color: Colors.blue[200],),
                  const SizedBox(width: 12,),
                  Text(folderName, style: const TextStyle(fontSize: 16),)
                ],),
                IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert, color: Colors.grey,),)
              ],),
            );
  }

  Column buildFileColumn(String img, String fileName, String extension) {
    return Column(
                  children: [
                    Container(
                      width: widthScreen * 0.31,
                      height: 110,
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset("assets/images/$img"),
                    ),
                    const SizedBox(height: 8,),
                    RichText(
                        text: TextSpan(
                          text: fileName,
                          style: const TextStyle(color: Colors.black, fontSize: 14),
                          children: [
                            TextSpan(text: extension, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300))
                          ]
                        )),
                  ],
                );
  }

  Column buildFileSizeChart(String title, Color color, double withPercentage) {
    return Column(
          children: [
            Container(
              width: widthScreen * withPercentage,
              height: 4,
              color: color,
            ),
            const SizedBox(height: 8,),
            Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),)

          ],
        );
  }
}
