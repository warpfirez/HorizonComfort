part of 'profile_cubit.dart';

enum ProfileStatus { initial, submitting, success, error }

@immutable
class ProfileState {
  final String email;
  final String fullName;
  final String phone;
  final ProfileStatus status;

  const ProfileState({
    required this.email,
    required this.fullName,
    required this.phone,
    required this.status,
  });

  factory ProfileState.initial() {
    return const ProfileState(
      email: '',
      fullName: '',
      phone: '',
      status: ProfileStatus.initial,
    );
  }

  ProfileState copyWith({
    String? newEmail,
    String? newFullName,
    String? newPhone,
    ProfileStatus? newStatus,
  }) {
    return ProfileState(
      email: newEmail ?? email,
      fullName: newFullName ?? fullName,
      phone: newPhone ?? phone,
      status: newStatus ?? status,
    );
  }

  bool get isValid =>
      (email.isNotEmpty && fullName.isNotEmpty && phone.isNotEmpty);

  List<Object> get props => [email, fullName, phone, status];
}
