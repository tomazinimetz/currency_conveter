# Currency Converter App

An app to convert currency based on [Free Currency API](freecurrencyapi.net).

## Getting Started

Run the following commands on prompt to get packages, build project and run app

    flutter pub get
    flutter packages pub run build_runner build
    flutter run

#### Video Demo:  <https://youtu.be/0VJWTN0P9ME>
#### Description:
The application aims, integrating with the Free Currency API, to provide the user with the conversion of the chosen currency to currencies of other types and countries, including cryptocurrencies.

Folders and Classes descriptions:
- Components: Class that store a custom component styled according to passed parameters
- Models: model classes for currency and currency converted
- Bloc: State Management Classes
- Repository: Abstract class and its implementation, responsible for making the call to the API
- Services: Abstract class and its implementation, responsible for making the call to the repository, receiving its response and returning a currency model
to the state.
- UI: Includes main screen, home screen and some components like DropDownButton and presents on mobile screen
- Shared: Features that are shared across the application, such as the service to Hive (data storage locally) and HttpClient
- Utils: Folder that includes formatters and the src, responsible for classes are useful, such as storing variables with the main colors of the app and
classes for formatting dates and values ​​and also for counting the name of all possible routes to navigate in the application
- App_dependencies: Class responsible for registering singletons and other services in a GetIt instance
