import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      if (event is ProfileStarted) {
        if (event.accessToken == null || event.accessToken!.isEmpty) {
          emit(ProfileAuthRequired());
        } else {
          emit(ProfileSuccess());
        }
      } else if (event is ProfileAuthChangedInfo) {
        if (event.accessToken == null || event.accessToken!.isEmpty) {
          emit(ProfileAuthRequired());
        } else {
          emit(ProfileSuccess());
        }
      }
    });
  }
}
