import 'package:flutter/material.dart';
import 'package:flutter04/pages/tabs/home.dart';


class NewsPage extends StatefulWidget {
  final String title;
  const NewsPage({super.key, this.title = "添加好友"});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ///用于文本输入框
  TextEditingController controller = new TextEditingController();

  /// 设置TextField中显示的内容
  void setEditeInputTextFunction(String flagText) {
    controller.text = flagText;
  }

  
  /// 清除TextField中显示的内容
  void clearEditeInputTextFunction() {
    List data1=data;//////有问题
    if(controller.text==""){
      setState(() {
        //getListTile();
        data=data1;
        
      });

    }else{
    List result=[];
    for(int i=0;i<data.length;i++){
      if(controller.text==data[i]["username"]){
        result.add(data[i]);
      }
    }

    setState(() {
      data.clear();
      for(int i=0;i<result.length;i++){
        data.add(result[i]);
      }
    });

    ///或者使用clear方法
    controller.clear();}
  }

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print(widget.title);
  }

  void _onSend() {
    setState(() {
      print(controller.text);
    });
    }

  List data=[
    {"url":"https://www.itying.com/images/flutter/7.png",
     "username":"云卷云舒",
     "type":"请求添加你为好友",
     "state":"同意"
    },{
      "url":"https://www.itying.com/images/flutter/1.png",
     "username":"张三",
     "type":"请求添加你为好友",
     "state":"同意"
    },{
      "url":"https://www.itying.com/images/flutter/3.png",
     "username":"GG Bond",
     "type":"请求添加对方为好友",
     "state":"等待通过"
    }
    ,{
      "url":"https://www.itying.com/images/flutter/2.png",
     "username":"李四",
     "type":"请求添加你为好友",
     "state":"同意"
    }
  ];
  List<Widget> getListTile(){
    List<Widget> listTile=[];
    for(int i=0;i<data.length;i++){
      listTile.add(
        ListTile(
                leading: ClipOval(
                  child: Image.network(
                    data[i]["url"],
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                title:  Text(data[i]["username"]),
                subtitle:  Text(data[i]["type"]),
                trailing:  Text(
                  data[i]["state"],),
              ),
              );}
       return listTile;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        /* floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.back_hand),
        ), */
        appBar: AppBar(
          leading:IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const HomePage();
                  }));
                },
                icon: const Icon(Icons.menu)),
          //automaticallyImplyLeading: false,
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 65, 159, 210),
        ),
        body: ListView(
          children: [
            Column(children: <Widget>[
              Row(
                children: [
                  Container(
                height: 80,
                width: 300,
                margin: const EdgeInsets.only(bottom: 0),
                child: Padding(padding: const EdgeInsets.all(15),child: 
                TextField(
                  cursorColor: Colors.black,
                  controller: controller,
                  keyboardType: TextInputType.multiline,

                  ///当TextField中输入的内容发生改变时回调
                  onChanged: (value) {
                    // ignore: avoid_print
                    print("TextField 中输入的内容 $value");
                  },
                  decoration:  InputDecoration(
                      hintText: "请输入准确用户名",
                      helperStyle: const TextStyle(
                        color: Color.fromARGB(255, 13, 13, 13),
                      ),
                      filled: true,
                      fillColor:const Color.fromARGB(43, 97, 95, 95),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
                )
              ),
              IconButton(onPressed: clearEditeInputTextFunction, icon: Icon(Icons.search))
              ],
              ),
              Column(children: getListTile(),),
            
              /* ListTile(
                leading: ClipOval(
                  child: Image.network(
                    "https://www.itying.com/images/flutter/7.png",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text("云卷云舒"),
                subtitle: const Text("请求添加你为好友"),
                trailing: const Text("同意"),
              ),
              ListTile(
                leading: ClipOval(
                  child: Image.network(
                    "https://www.itying.com/images/flutter/1.png",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text("落叶"),
                subtitle: const Text("请求添加你为好友"),
                trailing: const Text("同意"),
              ),
              ListTile(
                leading: ClipOval(
                  child: Image.network(
                    "https://www.itying.com/images/flutter/2.png",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text("GG爆"),
                subtitle: const Text("请求添加对方为好友"),
                trailing: const Text("等待通过"),
              ),
              ListTile(
                leading: ClipOval(
                  child: Image.network(
                    "https://www.itying.com/images/flutter/3.png",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text("张三"),
                subtitle: const Text("请求添加你为好友"),
                trailing: const Text("同意"),
              ), */
            ]),
          ],
        )
        );
}

}
