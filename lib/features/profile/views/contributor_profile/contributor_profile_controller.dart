import 'dart:async';

import 'package:colartive2/features/profile/model/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/state/base_state.dart';
import '../../data/user_repository.dart';

part 'contributor_profile_controller.g.dart';

@riverpod
Future<BaseState<AppUser>> fetchContributor(
  FetchContributorRef ref,
  String uid,
) {
  return BaseState.guard(ref.read(userRepoProvider).fetch(uid));
}

@riverpod
Future<BaseState<List<AppUser>>> fetchTopContributorList(
    FetchTopContributorListRef ref) {
  return BaseState.guard(ref.read(userRepoProvider).fetchTop());
}
