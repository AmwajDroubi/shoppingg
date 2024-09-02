// import 'package:bloc/bloc.dart';

// part 'profile_state.dart';

// class ProfileCubit extends Cubit<ProfileState> {
//   ProfileCubit() : super(ProfileInitial());

//    void getProfileData() {
//     emit(ProfileLoading());
//     Future.delayed(Duration(seconds: 1), () {

//       emit(ProfileLoaded());
//     });
//   }
// }
import 'package:bloc/bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    try {
      // Simulate data fetching with delay
      await Future.delayed(Duration(seconds: 1));
      // Here you would typically fetch data from a repository
      emit(ProfileLoaded());
    } catch (e) {
      emit(ProfileError(masg: e.toString()));
    }
  }
}
