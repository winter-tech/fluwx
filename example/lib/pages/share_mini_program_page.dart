import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';

class ShareMiniProgramPage extends StatefulWidget {
  const ShareMiniProgramPage({Key? key}) : super(key: key);

  @override
  State<ShareMiniProgramPage> createState() => _ShareMiniProgramPageState();
}

class _ShareMiniProgramPageState extends State<ShareMiniProgramPage> {
  WeChatScene scene = WeChatScene.session;
  String _webPageUrl = 'http://www.qq.com';
  String _thumbnail = 'https://timgsa.baidu.com/timg'
      '?image'
      '&quality=80'
      '&size=b9999_10000'
      '&sec=1534614311230'
      '&di=b17a892b366b5d002f52abcce7c4eea0'
      '&imgtype=0'
      '&src=http%3A%2F%2Fimg.mp.sohu.com%2Fupload%2F20170516%2F51296b2673704ae2992d0a28c244274c_th.png';
  String _title = 'Fluwx';
  String _userName = 'gh_d43f693ca31f';
  String _path = '/pages/media';
  String _description = 'Fluwx';

  Fluwx fluwx = Fluwx();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShareMiniProgram'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: _share,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: TextEditingController(text: 'http://www.qq.com'),
              onChanged: (str) {
                _webPageUrl = str;
              },
              decoration: InputDecoration(labelText: 'web page url'),
            ),
            TextField(
              controller: TextEditingController(text: 'gh_d43f693ca31f'),
              onChanged: (str) {
                _userName = str;
              },
              decoration: InputDecoration(labelText: 'user name'),
            ),
            TextField(
              controller: TextEditingController(text: '/pages/media'),
              onChanged: (str) {
                _path = str;
              },
              decoration: InputDecoration(labelText: 'user name'),
            ),
            TextField(
              controller: TextEditingController(text: 'Fluwx'),
              onChanged: (str) {
                _title = str;
              },
              decoration: InputDecoration(labelText: 'title'),
            ),
            TextField(
              controller: TextEditingController(text: 'Fluwx'),
              onChanged: (str) {
                _description = str;
              },
              decoration: InputDecoration(labelText: 'description'),
            ),
            TextField(
              controller: TextEditingController(text: 'images/logo.png'),
              onChanged: (str) {
                _thumbnail = str;
              },
              decoration: InputDecoration(labelText: 'thumbnail'),
            ),
          ],
        ),
      ),
    );
  }

  void _share() {
    var model = WeChatShareMiniProgramModel(
      webPageUrl: _webPageUrl,
      userName: _userName,
      title: _title,
      path: _path,
      description: _description,
    );
    fluwx.share(model);
  }
}
