# street-workout-places

An open-source mobile app whose main purpose will be to help you find street workout parks in a given location (e.g. in your neighborhood).
The project is still at an early stage of development.

## Architecture:
Mobile: </br>
The app is written in `Flutter` with `BLoC` as a state management solution. Models and blocs are generated using `Freezed` package.

Backend: </br>
In the beginning all data will be stored using `Firebase`. The ultimate goal is to create a dedicated backend server for that.