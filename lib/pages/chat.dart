import 'package:flutter/material.dart';
import '../pages/news.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key,
  required this.username
  });
  final String username;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Model> _data=[
    Model(avatar: "https://up.enterdesk.com/edpic_source/f2/c9/5e/f2c95e068ae68dbf0e9e0342870fdded.jpg", text: "hello", isMyself: false),
    Model(avatar: "https://up.enterdesk.com/edpic_source/f2/c9/5e/f2c95e068ae68dbf0e9e0342870fdded.jpg", text: "morning", isMyself: false),
    Model(avatar: "https://up.enterdesk.com/edpic_source/f2/c9/5e/f2c95e068ae68dbf0e9e0342870fdded.jpg", text: "hi~", isMyself: false),
    Model(avatar: "https://up.enterdesk.com/edpic_source/2e/74/18/2e7418e550a30005b33282a06c05c0be.jpg", text: "aaa", isMyself: true),
    Model(avatar: "https://up.enterdesk.com/edpic_source/f2/c9/5e/f2c95e068ae68dbf0e9e0342870fdded.jpg", text: "在吗？", isMyself: false),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  MyAppBar(username: widget.username,),
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          Focus.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(child: 
        Column(
      children: [
        chatView(),
        inputView(),
      ],
    )
    )
    );
  }

Widget chatView(){
  return Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4
              ),
              itemCount: _data.length,
              itemBuilder: (context, index){
                final model=_data.elementAt(index);
                return BubbleWidget(avatar: model.avatar, 
                text: model.text,
                textDirection: model.isMyself? TextDirection.rtl:TextDirection.ltr,
                color: model.isMyself?Color.fromARGB(189, 158, 199, 241):Color.fromARGB(255, 241, 231, 231),);
              },
        )
        );
}


  Widget inputView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,),
      child: Row(
      children: [
        Expanded(
            child: TextField(
              controller: _controller,
          maxLines: null,
          cursorColor: Colors.black,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            filled: true,
            fillColor:Color.fromARGB(43, 97, 95, 95),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16)),
          ),
        )),
        const SizedBox(
          width: 12,
        ),

        ElevatedButton(
          onPressed: _onSend,
          child:  Text("发送"),
          style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
        )
      ],
    )
    )
    ;
  }

  Future<void> _onSend() async{
    final text=_controller.text;
    final model=Model(
      avatar: "https://up.enterdesk.com/edpic_source/2e/74/18/2e7418e550a30005b33282a06c05c0be.jpg"
    , text: text, isMyself: true);
    setState(() {
      _data.add(model);
      print(text);
      _controller.clear();
    });}
}

class BubbleWidget extends StatelessWidget {
  const BubbleWidget(
      {super.key,
      required this.avatar,
      required this.text,
      required this.textDirection,
      required this.color,
      });
  final String avatar;
  final String text;
  final TextDirection textDirection;
  final Color color;

  @override
  Widget build(BuildContext context) {
       return Padding(padding: const EdgeInsets.symmetric(vertical: 8) ,
    child: Row(
      textDirection: textDirection,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(avatar),
          child: const SizedBox(
            width: 48,
            height: 48,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Flexible(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(32)),
          child: SelectableText(text),
        )),
      ],
    )
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key,required this.username
  }) : super(key: key);
  final String username;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      leading: const BackButton(),
      title:  Text(username),
      backgroundColor: Colors.white,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


class Model{
  final String avatar;
  final String text;
  final bool isMyself;
  Model({
    required this.avatar,
    required this.text,
    required this.isMyself,
 });
}