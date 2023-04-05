import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/app_strings.dart';

part 'app_error.freezed.dart';

@freezed
class AppError with _$AppError implements Exception {
  @override
  String get message;

  const factory AppError.cancelledByUser(
      [@Default(AppStrings.cancelledByUser) String message]) = _CancelledByUser;

//////////////////////////////////////////////////////////////////////
/////////////////////// Device Storage ERRORS ///////////////////////////////////
////////////////////////////////////////////////////////////////////

  const factory AppError.filePick(
      [@Default(AppStrings.errPickFile) String message]) = _FilePick;

  const factory AppError.fileSave(
      [@Default(AppStrings.errSaveFile) String message]) = _FileSave;

//////////////////////////////////////////////////////////////////////
/////////////////////// DB ERRORS ///////////////////////////////////
////////////////////////////////////////////////////////////////////

  const factory AppError.dbFetch(
      [@Default(AppStrings.errDbFetch) String message]) = _DbFecth;

  const factory AppError.dbInsert(
      [@Default(AppStrings.errDbInsert) String message]) = _DbInsert;

  const factory AppError.dbUpdate(
      [@Default(AppStrings.errDbUpdate) String message]) = _DbUpdate;

//////////////////////////////////////////////////////////////////////
/////////////////////// Auth ERRORS ///////////////////////////////////
////////////////////////////////////////////////////////////////////

  const factory AppError.unExpectedAuth(
      [@Default(AppStrings.errUnexpAuth) String message]) = _UnExpectedAuth;

  const factory AppError.unExpGoogleAuth(
          [@Default(AppStrings.errUnexpGoogAuth) String message]) =
      _UnExpGooogleAuth;

  const factory AppError.invalidCredential({
    required String code,
    @Default(AppStrings.invalidEmailPass) String message,
  }) = _InvalidCredential;

  const factory AppError.emailAlreadyInUse({
    required String code,
    @Default(AppStrings.emailAlreadyInUse) String message,
  }) = _EmailAlreadyInUse;

  const factory AppError.invalidEmail({
    required String code,
    @Default(AppStrings.invalidEmail) String message,
  }) = _InvalidEmail;

  const factory AppError.weakPassword({
    required String code,
    @Default(AppStrings.weakPassword) String message,
  }) = _WeakPassword;

  const factory AppError.accountLocked({
    required String code,
    @Default(AppStrings.accLocked) String message,
  }) = _AccountLocked;

  const factory AppError.accountNotVerified({
    required String code,
    @Default(AppStrings.accNotVer) String message,
  }) = _AccountNotVerified;

  const factory AppError.requireReAuth({
    required String code,
    @Default(AppStrings.requireReAuth) String message,
  }) = _RequireReAuth;

  const factory AppError.operNotAllowed({
    required String code,
    @Default(AppStrings.opNotAllowed) String message,
  }) = _OperNotAllowed;

  const factory AppError.invalidVerifCode({
    required String code,
    @Default(AppStrings.invalidCode) String message,
  }) = _InvalidVerifCode;
}
