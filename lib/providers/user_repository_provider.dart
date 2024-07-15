import 'package:diary_report_sample/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepository());
