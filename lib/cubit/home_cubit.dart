part of 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    getUsers();
  }
  MyService myCurrencyService = MyService();
  Future<void> getUsers() async {
    emit(HomeLoadingState());
    await myCurrencyService.getService().then((dynamic response) => {
          if (response is List<Course>)
            {emit(HomeCompleteState(response))}
          else
            {emit(HomeErrorState(response))}
        });
  }
}
