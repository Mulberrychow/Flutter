import 'package:flutter/material.dart';
import 'package:flutter04/pages/icon.dart';
//import '../search.dart';
import '../chat.dart';
import '../news.dart';
import '../newpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          /* leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ChatPage(username: "云淡风轻",);
                  }));
            },
          ), */
          backgroundColor: const Color.fromARGB(255, 65, 159, 210),
          title: const Text(
            "聊天",
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const NewsPage();
                  }));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[

            ListTile(
              leading: SizedBox(height: 50,width: 50,child:Image.asset("images/b.jpg") ,),
              title: Text("GG爆"),
              subtitle: Text("在吗？"),
              trailing: Text("16:59"),
              onTap: () {
                Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ChatPage(username: "GG爆",);
                  }));
              },
              minVerticalPadding: 0.5,
            ),
            ListTile(
              leading: SizedBox(height: 50,width: 50,child:Image.asset("images/a.jpg") ,),
              title: Text("同事"),
              subtitle: Text("吃饭了吗"),
              trailing: Text("13:59"),
               onTap: () {
                Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ChatPage(username: "同事",);
                  }));
              },
            ),
            ListTile(
              leading:SizedBox(height: 50,width: 50,child:Image.network("https://www.itying.com/images/flutter/1.png") ,),
              title: Text("A网友"),
              subtitle: Text("在吗？"),
              trailing: Text("12:29"),
              onTap: () {
                Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ChatPage(username: "A网友",);
                  }));
              },
            ),
            ListTile(
              leading:SizedBox(height: 50,width: 50,child:Image.network("https://www.itying.com/images/flutter/4.png") ,),
              title: Text("B网友"),
              subtitle: Text("吃了吗"),
              trailing: Text("16:59"),
              onTap: () {
                Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ChatPage(username: "B网友",);
                  }));
              },
            ),
            ListTile(
              leading:SizedBox(height: 50,width: 50,child:Image.network("https://www.itying.com/images/flutter/5.png") ,),
              title: Text("C网友"),
              subtitle: Text("睡了吗"),
              trailing: Text("星期六"),
              onTap: () {
                Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ChatPage(username: "C网友",);
                  }));
              },
            ),
            ListTile(
              leading:SizedBox(height: 50,width: 50,child:Image.network("https://www.itying.com/images/flutter/6.png") ,),
              title: Text("D网友"),
              subtitle: Text("在干嘛"),
              trailing: Text("星期二"),
              onTap: () {
                Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ChatPage(username: "D网友",);
                  }));
              },
            ),
            ListTile(
              leading:SizedBox(height: 50,width: 50,child:Image.network("https://www.itying.com/images/flutter/7.png") ,),
              title: Text("云淡风轻"),
              subtitle: Text("有空吗"),
              trailing: Text("5月6日"),
              onTap: () {
                Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ChatPage(username: "云淡风轻",);
                  }));
              },
            ),
            ListTile(
              leading:SizedBox(height: 50,width: 50,child:Image.network("https://www.itying.com/images/flutter/2.png") ,),
              title: Text("云淡风轻"),
              subtitle: Text("在吗？"),
              trailing: Text("3月3日"),
              onTap: () {
                Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ChatPage(username: "云淡风轻",);
                  }));
              },
            ),
            ListTile(
              leading:SizedBox(height: 50,width: 50,child:Image.network("https://www.itying.com/images/flutter/1.png") ,),
              title: Text("云淡风轻"),
              subtitle: Text("在吗？"),
              trailing: Text("1月2日"),
              onTap: () {
                Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ChatPage(username: "云淡风轻",);
                  }));
              },
            ),
          ],
        ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            //侧拉菜单头部
            DrawerHeader(
              child:  Image.network("https://www.itying.com/images/flutter/5.png"),
              decoration: BoxDecoration(color: const Color.fromARGB(255, 143, 167, 187)),
            ),
            ListTile(
              leading:const Icon(MyIcon.navigator,color: Color.fromARGB(255, 136, 180, 215),),
              title:const Text('新手入门'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewPage(pageName: "新手入门"),
                  ),
                );
              },
            ),
            ListTile(
              leading:const Icon(MyIcon.gonglue,color: Color.fromARGB(255, 215, 156, 156),),
              title:const Text('游戏攻略'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewPage(pageName: "游戏攻略"),
                  ),
                );
              },
            ),
            ListTile(
              leading:const Icon(MyIcon.xinwen,color: Colors.green,),
              title:const Text('游戏新闻'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewPage(pageName: "游戏新闻"),
                  ),
                );
              },
            ),
            ListTile(
              leading:const Icon(MyIcon.gonghui,color: Colors.black,),
              title:const Text('公会'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewPage(pageName: "公会"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
        );
  }
}



/* class ImageWidget extends StatelessWidget {
  final netImageUrl =
      "https://www.itying.com/images/flutter/5.png";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _loadFromNet(),
      ],
    );
  }

  Widget _loadFromNet() => Image.network(netImageUrl, height: 80);
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二页'),
      ),
      body: Center(
        child: Text('这是第二页的内容'),
      ),
    );
  }
}
 */