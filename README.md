# EasyLocalization
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/internationalization.png" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  easy_localization: ^2.3.3

assets:
   - assets/translations/en.json
   - assets/translations/pt.json
```

### Configuration

#### iOS Info.plist
```dart
<key>CFBundleLocalizations</key>
<array>
    <string>en</string>
    <string>pt</string>
</array>
```

### en.json 
```dart
{
    "title":"English version",
    "phrase":"You have switched the version to english"
}
```

### pt.json 
```dart
{
    "title":"Versão português",
    "phrase":"Você mudou a versão para português"
}
```

### Main
```dart
void main() {
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('pt')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'title'.tr()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          'phrase'.tr(),
        ),
      ),
    );
  }
}
```
