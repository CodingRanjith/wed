import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/core/router/route_paths.dart';
import 'package:wedding_planner_india/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OnboardingBloc>(),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatelessWidget {
  const _OnboardingView();

  static const _stepTitles = [
    'Bride Name',
    'Groom Name',
    'Wedding Date',
    'Location',
    'Wedding Type',
    'Budget',
    'Number of Guests',
    'Religion',
    'Tradition',
    'Currency',
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state.isComplete) {
          context.go(RoutePaths.home);
        }
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.createWedding),
            leading: state.currentStep > 0
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context
                        .read<OnboardingBloc>()
                        .add(const OnboardingPreviousStep()),
                  )
                : null,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinearProgressIndicator(
                      value: (state.currentStep + 1) /
                          OnboardingState.totalSteps,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Step ${state.currentStep + 1} of ${OnboardingState.totalSteps}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _stepTitles[state.currentStep],
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: _buildStepContent(context, state),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton(
                    onPressed: state.isSubmitting
                        ? null
                        : () => _onNext(context, state),
                    child: state.isSubmitting
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(
                            state.currentStep ==
                                    OnboardingState.totalSteps - 1
                                ? l10n.done
                                : l10n.next,
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onNext(BuildContext context, OnboardingState state) {
    if (!state.canProceed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in the required field')),
      );
      return;
    }
    if (state.currentStep == OnboardingState.totalSteps - 1) {
      context.read<OnboardingBloc>().add(const OnboardingCompleted());
    } else {
      context.read<OnboardingBloc>().add(const OnboardingNextStep());
    }
  }

  Widget _buildStepContent(BuildContext context, OnboardingState state) {
    final bloc = context.read<OnboardingBloc>();

    switch (state.currentStep) {
      case 0:
        return _TextStep(
          initialValue: state.brideName,
          hint: 'Enter bride name',
          icon: Icons.person_outline,
          onChanged: (v) => bloc.add(OnboardingFieldUpdated(brideName: v)),
        );
      case 1:
        return _TextStep(
          initialValue: state.groomName,
          hint: 'Enter groom name',
          icon: Icons.person,
          onChanged: (v) => bloc.add(OnboardingFieldUpdated(groomName: v)),
        );
      case 2:
        return _DateStep(
          selectedDate: state.weddingDate,
          onDateSelected: (d) =>
              bloc.add(OnboardingFieldUpdated(weddingDate: d)),
        );
      case 3:
        return _TextStep(
          initialValue: state.location,
          hint: 'City, State',
          icon: Icons.location_on_outlined,
          onChanged: (v) => bloc.add(OnboardingFieldUpdated(location: v)),
        );
      case 4:
        return _WeddingTypeStep(
          selected: state.weddingType,
          onSelected: (t) =>
              bloc.add(OnboardingFieldUpdated(weddingType: t)),
        );
      case 5:
        return _BudgetStep(
          value: state.budget,
          currency: state.currency,
          onChanged: (v) => bloc.add(OnboardingFieldUpdated(budget: v)),
        );
      case 6:
        return _GuestCountStep(
          value: state.guestCount,
          onChanged: (v) => bloc.add(OnboardingFieldUpdated(guestCount: v)),
        );
      case 7:
        return _ChoiceStep(
          options: AppConstants.religions,
          selected: state.religion,
          onSelected: (v) => bloc.add(OnboardingFieldUpdated(religion: v)),
        );
      case 8:
        return _ChoiceStep(
          options: AppConstants.traditions,
          selected: state.tradition,
          onSelected: (v) => bloc.add(OnboardingFieldUpdated(tradition: v)),
        );
      case 9:
        return _ChoiceStep(
          options: AppConstants.supportedCurrencies,
          selected: state.currency,
          onSelected: (v) => bloc.add(OnboardingFieldUpdated(currency: v)),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class _TextStep extends StatefulWidget {
  const _TextStep({
    required this.initialValue,
    required this.hint,
    required this.icon,
    required this.onChanged,
  });

  final String initialValue;
  final String hint;
  final IconData icon;
  final ValueChanged<String> onChanged;

  @override
  State<_TextStep> createState() => _TextStepState();
}

class _TextStepState extends State<_TextStep> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: Icon(widget.icon),
      ),
      textCapitalization: TextCapitalization.words,
      onChanged: widget.onChanged,
    );
  }
}

class _DateStep extends StatelessWidget {
  const _DateStep({
    required this.selectedDate,
    required this.onDateSelected,
  });

  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_today),
        title: Text(
          selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              : 'Select wedding date',
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () async {
          final date = await showDatePicker(
            context: context,
            initialDate:
                selectedDate ?? DateTime.now().add(const Duration(days: 180)),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 730)),
          );
          if (date != null) onDateSelected(date);
        },
      ),
    );
  }
}

class _WeddingTypeStep extends StatelessWidget {
  const _WeddingTypeStep({
    required this.selected,
    required this.onSelected,
  });

  final WeddingType selected;
  final ValueChanged<WeddingType> onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: WeddingType.values.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final type = WeddingType.values[index];
        final isSelected = type == selected;
        return Card(
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : null,
          child: ListTile(
            title: Text(type.label),
            trailing: isSelected
                ? Icon(Icons.check_circle,
                    color: Theme.of(context).colorScheme.primary)
                : null,
            onTap: () => onSelected(type),
          ),
        );
      },
    );
  }
}

class _BudgetStep extends StatelessWidget {
  const _BudgetStep({
    required this.value,
    required this.currency,
    required this.onChanged,
  });

  final double value;
  final String currency;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${currency == 'INR' ? '₹' : currency} ${value.toStringAsFixed(0)}',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 24),
        Slider(
          value: value,
          min: 100000,
          max: 5000000,
          divisions: 49,
          label: value.toStringAsFixed(0),
          onChanged: onChanged,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('₹1L'),
            Text('₹50L'),
          ],
        ),
      ],
    );
  }
}

class _GuestCountStep extends StatelessWidget {
  const _GuestCountStep({
    required this.value,
    required this.onChanged,
  });

  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$value guests',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 24),
        Slider(
          value: value.toDouble(),
          min: 50,
          max: 2000,
          divisions: 39,
          label: '$value',
          onChanged: (v) => onChanged(v.round()),
        ),
      ],
    );
  }
}

class _ChoiceStep extends StatelessWidget {
  const _ChoiceStep({
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  final List<String> options;
  final String selected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((option) {
        final isSelected = option == selected;
        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (_) => onSelected(option),
        );
      }).toList(),
    );
  }
}
