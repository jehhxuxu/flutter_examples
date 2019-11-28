# TimePicker
<p align="center">
<img src="https://docs.google.com/uc?id=199dKuI7GPoySPqynTXvdruaV-hFcPBPd" height="649" width="300">
</p>

### Dependencies
```dart
dependencies:
  flutter:
    sdk: flutter
  date_format: ^1.0.8
```

```dart
class _MyHomePageState extends State<MyHomePage> {
  final _timeOfDayController = TextEditingController();

  Future _selectTime() async {
    TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );

    if (timeOfDay != null) {
      setState(
        () {
          _timeOfDayController.text = timeOfDay.format(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: TextField(
          controller: _timeOfDayController,
          decoration: InputDecoration(
            labelText: "TimePicker",
            suffixIcon: IconButton(
              onPressed: _selectTime,
              icon: Icon(Icons.timer),
            ),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
```
