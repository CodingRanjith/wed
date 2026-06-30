part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  const OnboardingState({
    this.currentStep = 0,
    this.brideName = '',
    this.groomName = '',
    this.weddingDate,
    this.location = '',
    this.weddingType = WeddingType.tamilHindu,
    this.budget = 700000,
    this.guestCount = 300,
    this.religion = 'Hindu',
    this.tradition = 'Tamil',
    this.currency = 'INR',
    this.isSubmitting = false,
    this.isComplete = false,
    this.errorMessage,
  });

  static const int totalSteps = 10;

  final int currentStep;
  final String brideName;
  final String groomName;
  final DateTime? weddingDate;
  final String location;
  final WeddingType weddingType;
  final double budget;
  final int guestCount;
  final String religion;
  final String tradition;
  final String currency;
  final bool isSubmitting;
  final bool isComplete;
  final String? errorMessage;

  bool get canProceed {
    switch (currentStep) {
      case 0:
        return brideName.trim().isNotEmpty;
      case 1:
        return groomName.trim().isNotEmpty;
      case 2:
        return weddingDate != null;
      case 3:
        return location.trim().isNotEmpty;
      default:
        return true;
    }
  }

  OnboardingState copyWith({
    int? currentStep,
    String? brideName,
    String? groomName,
    DateTime? weddingDate,
    String? location,
    WeddingType? weddingType,
    double? budget,
    int? guestCount,
    String? religion,
    String? tradition,
    String? currency,
    bool? isSubmitting,
    bool? isComplete,
    String? errorMessage,
  }) {
    return OnboardingState(
      currentStep: currentStep ?? this.currentStep,
      brideName: brideName ?? this.brideName,
      groomName: groomName ?? this.groomName,
      weddingDate: weddingDate ?? this.weddingDate,
      location: location ?? this.location,
      weddingType: weddingType ?? this.weddingType,
      budget: budget ?? this.budget,
      guestCount: guestCount ?? this.guestCount,
      religion: religion ?? this.religion,
      tradition: tradition ?? this.tradition,
      currency: currency ?? this.currency,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isComplete: isComplete ?? this.isComplete,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        currentStep,
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
        isSubmitting,
        isComplete,
        errorMessage,
      ];
}
