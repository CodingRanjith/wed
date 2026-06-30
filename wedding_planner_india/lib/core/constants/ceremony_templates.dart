import 'package:wedding_planner_india/core/constants/app_constants.dart';

class CeremonyTemplate {
  const CeremonyTemplate({
    required this.name,
    required this.side,
    required this.defaultChecklist,
    this.description = '',
  });

  final String name;
  final CeremonySide side;
  final String description;
  final List<String> defaultChecklist;
}

class CeremonyTemplates {
  CeremonyTemplates._();

  static List<CeremonyTemplate> forWeddingType(WeddingType type) {
    switch (type) {
      case WeddingType.tamilHindu:
        return tamilHinduCeremonies;
      case WeddingType.telugu:
        return teluguCeremonies;
      case WeddingType.keralaHindu:
        return keralaCeremonies;
      default:
        return tamilHinduCeremonies;
    }
  }

  static const List<CeremonyTemplate> tamilHinduCeremonies = [
    CeremonyTemplate(
      name: 'Ponnu Paarkum',
      side: CeremonySide.bride,
      description: 'Bride viewing ceremony',
      defaultChecklist: [
        'Saree',
        'Flowers',
        'Sweet',
        'Snacks',
        'Juice',
        'Chairs',
        'Decorations',
        'Photographer',
        'Return Gifts',
      ],
    ),
    CeremonyTemplate(
      name: 'Nichayathartham',
      side: CeremonySide.both,
      description: 'Engagement ceremony',
      defaultChecklist: [
        'Engagement rings',
        'Fruits & sweets',
        'Garlands',
        'Priest arrangements',
        'Invitation list',
        'Venue booking',
        'Photographer',
      ],
    ),
    CeremonyTemplate(
      name: 'Sumangali Pooja',
      side: CeremonySide.bride,
      defaultChecklist: ['Sarees for sumangalis', 'Fruits', 'Flowers', 'Pooja items'],
    ),
    CeremonyTemplate(
      name: 'Mehendi',
      side: CeremonySide.bride,
      defaultChecklist: ['Mehendi artist', 'Chairs', 'Music', 'Snacks', 'Photographer'],
    ),
    CeremonyTemplate(
      name: 'Nalangu',
      side: CeremonySide.bride,
      defaultChecklist: ['Turmeric paste', 'Flowers', 'Music', 'Traditional games'],
    ),
    CeremonyTemplate(
      name: 'Reception',
      side: CeremonySide.both,
      defaultChecklist: ['Venue', 'Catering', 'Stage decor', 'DJ', 'Photographer'],
    ),
    CeremonyTemplate(
      name: 'Muhurtham',
      side: CeremonySide.both,
      defaultChecklist: [
        'Mandapam',
        'Priest',
        'Thaali & metti',
        'Saree & veshti',
        'Flowers',
        'Nadaswaram',
        'Photographer',
        'Videographer',
      ],
    ),
    CeremonyTemplate(
      name: 'Grihapravesam',
      side: CeremonySide.both,
      defaultChecklist: ['New home decor', 'Pooja items', 'Milk boiling ceremony'],
    ),
    CeremonyTemplate(
      name: 'Maruveedu',
      side: CeremonySide.bride,
      defaultChecklist: ['Gifts for in-laws', 'Sarees', 'Return gifts', 'Travel arrangements'],
    ),
    CeremonyTemplate(
      name: 'Mapillai Azhaippu',
      side: CeremonySide.groom,
      description: 'Groom invitation ceremony',
      defaultChecklist: ['Veshti & shirt', 'Fruits', 'Garlands', 'Snacks'],
    ),
    CeremonyTemplate(
      name: 'Janavasam',
      side: CeremonySide.groom,
      defaultChecklist: ['Decorated car', 'Band', 'Flowers', 'Route planning'],
    ),
    CeremonyTemplate(
      name: 'Viratham',
      side: CeremonySide.groom,
      defaultChecklist: ['Sacred thread', 'Pooja items', 'Priest', 'Fasting arrangements'],
    ),
    CeremonyTemplate(
      name: 'Kasi Yatra',
      side: CeremonySide.groom,
      defaultChecklist: ['Umbrella', 'Fan', 'Temple items', 'Traditional props'],
    ),
    CeremonyTemplate(
      name: 'Oonjal',
      side: CeremonySide.both,
      defaultChecklist: ['Swing decor', 'Flowers', 'Milk & bananas', 'Colored rice'],
    ),
    CeremonyTemplate(
      name: 'Kanyadanam',
      side: CeremonySide.both,
      defaultChecklist: ['Kanyadanam items', 'Garlands', 'Priest instructions'],
    ),
    CeremonyTemplate(
      name: 'Mangalya Dharanam',
      side: CeremonySide.both,
      defaultChecklist: ['Thaali', 'Sacred thread', 'Mantras sheet'],
    ),
    CeremonyTemplate(
      name: 'Sapthapadi',
      side: CeremonySide.both,
      defaultChecklist: ['Seven steps setup', 'Fire ritual items', 'Priest'],
    ),
  ];

  static const List<CeremonyTemplate> teluguCeremonies = [
    CeremonyTemplate(
      name: 'Nischitartham',
      side: CeremonySide.both,
      defaultChecklist: ['Rings', 'Fruits', 'Clothes exchange'],
    ),
    CeremonyTemplate(
      name: 'Snathakam',
      side: CeremonySide.groom,
      defaultChecklist: ['Sacred thread', 'Pooja items'],
    ),
    CeremonyTemplate(
      name: 'Kashi Yatra',
      side: CeremonySide.groom,
      defaultChecklist: ['Traditional props', 'Umbrella'],
    ),
    CeremonyTemplate(
      name: 'Mangala Snanam',
      side: CeremonySide.bride,
      defaultChecklist: ['Turmeric', 'Oil', 'Flowers'],
    ),
    CeremonyTemplate(
      name: 'Muhurtham',
      side: CeremonySide.both,
      defaultChecklist: ['Mandapam', 'Priest', 'Mangalsutra', 'Saree'],
    ),
  ];

  static const List<CeremonyTemplate> keralaCeremonies = [
    CeremonyTemplate(
      name: 'Nischayam',
      side: CeremonySide.both,
      defaultChecklist: ['Rings', 'Muhurtham date', 'Astrologer'],
    ),
    CeremonyTemplate(
      name: 'Muhurtham',
      side: CeremonySide.both,
      defaultChecklist: ['Kasavu saree', 'Mundu', 'Thali', 'Sadya catering'],
    ),
  ];

  static const Map<TimelineStage, List<String>> defaultTimelineTasks = {
    TimelineStage.days365: [
      'Set wedding date & muhurtham',
      'Create guest list draft',
      'Set overall budget',
      'Book wedding hall',
    ],
    TimelineStage.days300: [
      'Book photographer & videographer',
      'Book caterer',
      'Start shopping for jewelry',
      'Book makeup artist',
    ],
    TimelineStage.days180: [
      'Order wedding invitations',
      'Book decorator',
      'Plan honeymoon',
      'Book priest',
    ],
    TimelineStage.days120: [
      'Send invitations',
      'Finalize menu',
      'Book rental car',
      'Dress trials',
    ],
    TimelineStage.days90: [
      'Confirm vendor payments',
      'RSVP follow-up',
      'Plan seating arrangement',
      'Book accommodation for guests',
    ],
    TimelineStage.days60: [
      'Finalize saree & veshti',
      'Mehendi artist booking',
      'Return gifts purchase',
      'Rehearsal planning',
    ],
    TimelineStage.days30: [
      'Final guest count',
      'Vendor final meetings',
      'Pack for ceremonies',
      'Document checklist',
    ],
    TimelineStage.days15: [
      'Confirm all vendors',
      'Payment settlements',
      'Emergency kit packing',
      'Beauty regimen',
    ],
    TimelineStage.days7: [
      'Final dress fitting',
      'Jewelry collection',
      'Rehearsal',
      'Rest & self-care',
    ],
    TimelineStage.weddingDay: [
      'Morning pooja',
      'Ceremony checklist',
      'Guest coordination',
      'Photography moments list',
    ],
    TimelineStage.afterMarriage: [
      'Thank you cards',
      'Gift tracking',
      'Document submission',
      'Honeymoon prep',
    ],
  };
}
