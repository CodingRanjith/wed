part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class OnboardingFieldUpdated extends OnboardingEvent {
  const OnboardingFieldUpdated({
    this.brideName,
    this.groomName,
    this.weddingDate,
    this.location,
    this.weddingType,
    this.budget,
    this.guestCount,
    this.religion,
    this.tradition,
    this.currency,
  });

  final String? brideName;
  final String? groomName;
  final DateTime? weddingDate;
  final String? location;
  final WeddingType? weddingType;
  final double? budget;
  final int? guestCount;
  final String? religion;
  final String? tradition;
  final String? currency;

  @override
  List<Object?> get props => [
        brideName,
        groomName,
        weddingDate,
        location,
        weddingType,
        budget,
        guestCount,
        religion,
        tradition,
        currency,
      ];
}

class OnboardingNextStep extends OnboardingEvent {
  const OnboardingNextStep();
}

class OnboardingPreviousStep extends OnboardingEvent {
  const OnboardingPreviousStep();
}

class OnboardingCompleted extends OnboardingEvent {
  const OnboardingCompleted();
}
