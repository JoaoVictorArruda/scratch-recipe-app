import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratch_recipe_app/domain/profile/i_profile_repository.dart';
import 'package:scratch_recipe_app/domain/profile/profile.dart';

class ProfileOverviewState {

  final bool isLoading;
  final Profile profile;

  ProfileOverviewState({required this.isLoading, required this.profile});

  factory ProfileOverviewState.initial() {
    return ProfileOverviewState(
      isLoading: true,
      profile: Profile.empty(),
    );
  }

  ProfileOverviewState copyWith({
    bool? isLoading,
    Profile? profile,
  }) {
    return ProfileOverviewState(
      isLoading: isLoading ?? this.isLoading,
      profile: profile ?? this.profile,
    );
  }

}

class ProfileOverviewCubit extends Cubit<ProfileOverviewState> {

  ProfileOverviewCubit(this.profileRepository) : super(ProfileOverviewState.initial());

  final IProfileRepository profileRepository;

  void initial() async {
    Profile profile = await profileRepository.getProfile();
    emit(state.copyWith(profile: profile, isLoading: false));
  }

}