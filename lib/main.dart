import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Selectable Text';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.white,
        ),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: buildText(),
      ),
    );
  }

  Widget buildText() {
    final text = '''Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
pariatur. Excepteur sint occaecat cupidatat non proident,
sunt in culpa qui officia deserunt mollit anim id est laborum.''';

    return TextSelectionTheme(
      data: TextSelectionThemeData(
          //cursorColor: Colors.red,
          //selectionColor: Colors.orange,
          //selectionHandleColor: Colors.green,
          ),
      child: SelectableText(
        text,
        style: TextStyle(fontSize: 32),
        scrollPhysics: BouncingScrollPhysics(),
        //toolbarOptions: ToolbarOptions(copy: true, selectAll: true),
        //maxLines: 10,
        showCursor: true,
        onSelectionChanged: (selection, cause) {
          final selectedText = text.substring(selection.start, selection.end);

          print('Selection: $selectedText');
        },
      ),
    );
  }
}
