import 'package:colartive2/utils/error/app_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/providers/core_providers.dart';

final googleAuthRepoProvider = Provider<GoogleAuthRepository>((ref) {
  final googleSignIn = ref.watch(googleSignInProvider);
  return GoogleAuthRepository(googleSignIn);
});

class GoogleAuthRepository {
  final GoogleSignIn _googleSignIn;

  GoogleAuthRepository(this._googleSignIn);

  TaskEither<AppError, OAuthCredential> signInWithGoogle() {
    return TaskEither.tryCatch(
      () => _googleSignIn.signIn(),
      (_, __) => const AppError.cancelledByUser(),
    )
        .chainEither(
          (r) => Either.fromNullable(r, () => const AppError.cancelledByUser()),
        )
        .flatMap(
          (r) => _googleAuthenticate(r),
        );
  }

  TaskEither<AppError, OAuthCredential> _googleAuthenticate(
    GoogleSignInAccount googleUser,
  ) {
    return TaskEither.tryCatch(
      () => googleUser.authentication,
      (error, _) => const AppError.unExpGoogleAuth(),
    ).map(
      (guser) => OAuthCredential(
        providerId: 'google.com',
        signInMethod: 'google.com',
        idToken: guser.idToken,
        accessToken: guser.accessToken,
      ),
    );
  }

  TaskEither<AppError, Unit> signOut() {
    return TaskEither.tryCatch(
      () => _googleSignIn.isSignedIn(),
      (error, _) => const AppError.unExpGoogleAuth(),
    ).flatMap(
      (signedIn) {
        if (signedIn) {
          return TaskEither.tryCatch(
            () => _googleSignIn.signOut(),
            (error, _) => const AppError.unExpGoogleAuth(),
          );
        } else {
          return TaskEither.right(unit);
        }
      },
    ).map((r) => unit);
  }
}
