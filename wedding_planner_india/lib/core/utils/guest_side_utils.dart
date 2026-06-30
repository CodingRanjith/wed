import 'package:flutter/material.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/domain/entities/guest_entity.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

extension GuestSideX on GuestSide {
  static const mainSides = [
    GuestSide.brideWomen,
    GuestSide.brideMen,
    GuestSide.groomWomen,
    GuestSide.groomMen,
  ];

  String label(AppLocalizations l10n) => switch (this) {
        GuestSide.brideWomen => l10n.brideSideWomen,
        GuestSide.brideMen => l10n.brideSideMen,
        GuestSide.groomWomen => l10n.groomSideWomen,
        GuestSide.groomMen => l10n.groomSideMen,
        GuestSide.friends => l10n.guestSideFriends,
        GuestSide.office => l10n.guestSideOffice,
        GuestSide.vip => l10n.guestSideVip,
      };

  IconData get icon => switch (this) {
        GuestSide.brideWomen || GuestSide.groomWomen => Icons.woman,
        GuestSide.brideMen || GuestSide.groomMen => Icons.man,
        GuestSide.friends => Icons.people,
        GuestSide.office => Icons.business_center,
        GuestSide.vip => Icons.star,
      };

  Color sideColor(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return switch (this) {
      GuestSide.brideWomen || GuestSide.brideMen => scheme.primary,
      GuestSide.groomWomen || GuestSide.groomMen => scheme.tertiary,
      _ => scheme.secondary,
    };
  }

  bool get isWomen =>
      this == GuestSide.brideWomen || this == GuestSide.groomWomen;

  bool get isMen => this == GuestSide.brideMen || this == GuestSide.groomMen;

  static GuestSide parse(String value) {
    const legacy = <String, GuestSide>{
      'bride': GuestSide.brideWomen,
      'groom': GuestSide.groomMen,
      'family': GuestSide.brideWomen,
    };
    if (legacy.containsKey(value)) return legacy[value]!;
    return GuestSide.values.firstWhere(
      (e) => e.name == value,
      orElse: () => GuestSide.brideWomen,
    );
  }
}

extension FoodPreferenceX on FoodPreference {
  String label(AppLocalizations l10n) => switch (this) {
        FoodPreference.veg => l10n.veg,
        FoodPreference.nonVeg => l10n.nonVeg,
        FoodPreference.jain => l10n.jainFood,
      };
}

extension GuestListX on List<GuestEntity> {
  int countForSide(GuestSide side) => where((g) => g.side == side).length;

  int comingCountForSide(GuestSide side) => where(
        (g) => g.side == side && g.rsvpStatus == RsvpStatus.coming,
      ).length;

  int foodCountForSide(GuestSide side, FoodPreference food) => where(
        (g) =>
            g.side == side &&
            g.rsvpStatus == RsvpStatus.coming &&
            g.foodPreference == food,
      ).length;
}
