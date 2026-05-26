import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/data/repositories/firebase_auth_repository.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/signup_usecase.dart';
import 'features/auth/domain/usecases/google_signin_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // Initialize Firebase
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: String.fromEnvironment('FIREBASE_API_KEY'),
        appId: String.fromEnvironment('FIREBASE_APP_ID'),
        messagingSenderId: String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID'),
        projectId: String.fromEnvironment('FIREBASE_PROJECT_ID'),
        storageBucket: String.fromEnvironment('FIREBASE_STORAGE_BUCKET'),
      ),
    );
    // Initialize Google Sign In with client ID for Web
    await GoogleSignIn.instance.initialize(
      clientId: const String.fromEnvironment('GOOGLE_SIGN_IN_CLIENT_ID'),
    );
  } else {
    await Firebase.initializeApp();
    // Initialize Google Sign In with default native config
    await GoogleSignIn.instance.initialize();
  }

  // Register external dependencies
  serviceLocator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  serviceLocator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.instance);

  // Register Auth Feature
  _initAuth();
}

void _initAuth() {
  // Repositories
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => FirebaseAuthRepository(
      firebaseAuth: serviceLocator<FirebaseAuth>(),
      googleSignIn: serviceLocator<GoogleSignIn>(),
    ),
  );

  // Use cases
  serviceLocator.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(serviceLocator<AuthRepository>()),
  );
  serviceLocator.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(serviceLocator<AuthRepository>()),
  );
  serviceLocator.registerLazySingleton<GoogleSignInUseCase>(
    () => GoogleSignInUseCase(serviceLocator<AuthRepository>()),
  );
  serviceLocator.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(serviceLocator<AuthRepository>()),
  );

  // BLoC (registered as factory so new instances are created when needed)
  serviceLocator.registerFactory<AuthBloc>(
    () => AuthBloc(
      loginUseCase: serviceLocator<LoginUseCase>(),
      signUpUseCase: serviceLocator<SignUpUseCase>(),
      googleSignInUseCase: serviceLocator<GoogleSignInUseCase>(),
      logoutUseCase: serviceLocator<LogoutUseCase>(),
    ),
  );
}
