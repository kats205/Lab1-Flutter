import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> login({required String email, required String password});

  Future<UserEntity?> signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<UserEntity?> googleSignIn();

  Future<void> logout();
}
