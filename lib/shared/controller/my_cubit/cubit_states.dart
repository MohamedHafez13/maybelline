abstract class AppStates {}

class AppInitialState extends AppStates {}

class HomeLoadingState extends AppStates {}

class HomeSuccessState extends AppStates {}

class HomeErrorState extends AppStates {
  final String error;

  HomeErrorState(this.error);
}
class SearchLoadingState extends AppStates{}
class SearchLoadedState extends AppStates{}