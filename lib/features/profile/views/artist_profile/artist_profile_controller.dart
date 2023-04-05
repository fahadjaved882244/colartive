import 'dart:async';

import 'package:colartive2/features/profile/model/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/state/base_state.dart';
import '../../data/user_repository.dart';

part 'artist_profile_controller.g.dart';

@riverpod
Future<BaseState<AppUser>> fetchArtist(
  FetchArtistRef ref,
  String uid,
) {
  return BaseState.guard(ref.read(userRepoProvider).fetch(uid));
}

@riverpod
Future<BaseState<List<AppUser>>> fetchTopArtistList(FetchTopArtistListRef ref) {
  return BaseState.guard(ref.read(userRepoProvider).fetchTop());
}
