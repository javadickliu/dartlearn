import 'dart:async';
import 'dart:io';

import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/bean/LoginBean.dart';
import 'package:flutter_app/packagelearn/PackageOne.dart';
import 'package:flutter_app/packagelearn/PackageTwo.dart' as PackageTwo;
import 'package:flutter_app/ui/Test1Activity.dart';
import 'package:permission_handler/permission_handler.dart';

//
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  testDioHttp();
  checkPermission();
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyScaffold(),
  ));
}

///检查权限
checkPermission() async {
  // PermissionStatus permissionStatus =await
  // PermissionHandler().checkPermissionStatus(PermissionGroup.);
//  if(permissionStatus.toString()==PermissionStatus.disabled){
//      Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.location]);
//  }
  // bool isOpened = await PermissionHandler().openAppSettings();
  // print("PermissionGroup.location 权限是否获取"+future.toString());
}

///网络请求
testDioHttp() async {
  BaseOptions options = BaseOptions(
    baseUrl: "https://api.xiaobeibike.com/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType:Headers.jsonContentType,
    responseType:  ResponseType.json
  );

  PackageOneClass packageOneClass=PackageOneClass();
  PackageTwo.PackageOneClass packageOneClass1=PackageTwo.PackageOneClass();

//var intType=const [];

//int intType1=1;
//  final intType2;
//  final int intType13=1;
//dynamic intType4=1;

//  var list = ['apples', 'bananas', 'oranges'];
//  list.forEach(f)
  var dio = new Dio(options);

  dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
  try{
  //  throw HttpException("DDDD");
    throw FormatException("DDDD");
  }on IOException{
       print(" on IOException");
  } on FormatException catch(e){
    print(" on FormatException e="+e.toString());
  } catch(e){
    print(" catch AllException");
  }finally{
    print(" finally  AllException");
  }
//  throw Exception("this is a excption");
//  throw "";
  var requestparams={"account":"18665314150","pwd":"123456","cid":"f79764e5e757315373c81a613ec26359"};
  Response response = await dio.post("Api/Operation/Login/",data: requestparams);
//  var jsonData=response.data
 // print("testDioHttp  jsonData" +jsonData.toString());
  //todo 1.dio默认的contentype是application/json 2.data 把请求参数放在data属性 如果请求参数要拼接在url可以设置queryParameters属性
  //todo 2.了解Response的属性含义
  //todo 3.取消http请求 利用CancleToken
  //todo 4.解析相应body 好像现在dio不能直接添加回调解析json 需要获取字符串后解析
  //todo 5.dart bean类的格式
}


class AmapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AmapView(
      // 地图类型
      mapType: MapType.Standard,
      // 是否显示缩放控件
      showZoomControl: true,
      // 是否显示指南针控件
      showCompass: true,
      // 是否显示比例尺控件
      showScaleControl: true,
      // 是否使能缩放手势
      zoomGesturesEnabled: true,
      // 是否使能滚动手势
      scrollGesturesEnabled: true,
      // 是否使能旋转手势
      rotateGestureEnabled: true,
      // 是否使能倾斜手势
      tiltGestureEnabled: true,
      // 缩放级别
      zoomLevel: 10,
      // 中心点坐标
      centerCoordinate: LatLng(39, 116),
      // 标记
      markers: <MarkerOption>[],
      // 地图创建完成回调
      onMapCreated: (controller) async {
        // requestPermission是权限请求方法, 需要你自己实现
        // 如果不知道怎么处理, 可以参考example工程的实现, example过程依赖了`permission_handler`插件.
        // if (await requestPermission()) {
        await controller.showMyLocation(true);
        //}
      },
    );
  }
}

//Future<bool> requestPermission() async {
//  final permissions =
//  await PermissionHandler().requestPermissions([PermissionGroup.location]);
//
//  if (permissions[PermissionGroup.location] == PermissionStatus.granted) {
//    return true;
//  } else {
//    toast('需要定位权限!');
//    return false;
//  }
//}

//void main(){//主程序入口
//  var stringTest="string";
//  var stringTest1='string'+
//  "ff";
//
//}
//int testMethod5(String name,int age,{int a,String b,int c,String d}){
//  return 6;
//}

///button的点击事件监听
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print("点击事件");
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('Engage'),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null 会禁用 button
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

/***
 * 界面的脚手架
 */
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirstScreen();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Image.asset("images/location_marker.png"),
          new Text('41'),
        ],
      ),
    );
    return titleSection;
    //...
  }
}

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
//          //child: new Text(wordPair.asPascalCase),
//          child: new RandomWords(),
//        ),
//      ),
//    );
//  }

// final wordPair=new WordPair.random();
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'+new RandomWords().toString()),
//    );
//  }
//}

///最小类继承自StatefulWidget
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0); //文字的样式
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    /**
     * Dart学习
     */
//    var stringTest="string";
//    var stringTest1='string'+
//  "ff";
//    var stringTest2="""string46hfghfhfgh
//     ff""";
//
//    final changliang=9;
//     var test=testMethod4("",5,1,2,3,"");
//    final changliang1=new DateTime(0).millisecondsSinceEpoch;
//    const changliang2="";
//    const changliang3=new DateTime().millisecondsSinceEpoch;
//    var list=["A","B"];
//    list..add(value)
//    var fixedList=new List(5);
//    fixedList.add(0);
//    fixedList.length=0;

//    var growableList=new List();
//    growableList.add("A");
//    var growableList1=const ["A","B"];
//    growableList1.add("C");
//    var set=Set();
//    set.add("");
//    var set1={'',""};

//    int testMethod(name){
//      return 6;
//    }
//    testMethod("");

//    String test ;
////    test++;
////    test--;
////    test--;
////    test=null;
////    test?.length;
//       var intType=0;
//       var stringType=intType as String;
//
//    var testA="A";
//    var testB;
//    testA??="A";
//    testB??="B";

//    double doubleTest = 5.5;
//    int intTest = 5;
//    var retultA = doubleTest~/2;
//    var retultB = intTest~/2;

//    int testInt=5;
//    testInt.toUnsigned(5);
//    testInt.isEven=true;
//    testInt.floor();
//
//    testInt..toUnsigned(5)..isEven=true..floor();

    //=========================================
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:retultA=',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

int testMethod(name) {
  int testInnerMethod(String name) {
    return 6;
  }

  testInnerMethod("");
  return 6;
}

int testMethod1(String name) {
  return 6;
}

int testMethod2(String name) => 0;

int testMethod3(String name, int age, [int a, String b, int c, String d]) {
  return 6;
}

int testMethod4(String name, int age, {int a, String b, int c, String d}) {
  return 6;
}
