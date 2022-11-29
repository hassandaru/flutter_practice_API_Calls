# flutter_practice_API_Calls
json decode encode serialization , builder and calling API
you need to call :
flutter packages pub run build_runner build
in terminal to build serialised models that can communicate with API.

Another point is in pubspec.yaml, we need to add:
dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.3.2
  json_serializable: ^6.5.4
  
  for this to work.
