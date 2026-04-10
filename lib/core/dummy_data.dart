class DummyData {
  static final List<Map<String, dynamic>> rentalShops = [
    {
      'id': '1',
      'name': 'عدسة صنعاء',
      'location': 'العليا، صنعاء',
      'description': 'وجهتك الأولى لاستئجار أحدث معدات التصوير السينمائي والفوتوغرافي في الرياض مع ضمان الجودة.',
      'image': 'assets/images/rental_shop_1.jpg',
      'tags': ['TOP RATED', 'CINEMA', 'LENS'],
      'rating': 4.9,
    },
    {
      'id': '2',
      'name': 'سينما كرافت',
      'location': 'حي الروضة، صنعاء',
      'description': 'متخصصون في معدات تصوير الأفلام المستقلة والإعلانات التجارية. نوفر طواقم إضاءة متكاملة.',
      'image': 'assets/images/rental_shop_2.jpg',
      'tags': ['LIGHTING', 'DRONE'],
      'rating': 4.8,
    },
    {
      'id': '3',
      'name': 'فيجن برو',
      'location': 'الدانة، صنعاء',
      'description': 'أكبر تشكيلة من كاميرات سوني وكانون للإيجار اليومي والأسبوعي بأسعار تنافسية.',
      'image': 'assets/images/rental_shop_3.jpg',
      'tags': ['CAMERAS', 'ACCESSORIES'],
      'rating': 4.7,
    },
    {
      'id': '4',
      'name': 'عين الطائر ',
      'location': 'العزيزية، صنعاء',
      'description': 'استوديوهات مجهزة بالكامل للإيجار بالساعة مع توفير معدات تصوير بورتريه متخصصة.',
      'image': 'assets/images/rental_shop_4.jpg',
      'tags': ['STUDIO', 'STROBE'],
      'rating': 4.6,
    },
  ];

  static final List<Map<String, dynamic>> photographers = [
    {
      'id': '1',
      'name': 'أحمد العمري',
      'specialty': 'متخصص في تصوير الطبيعة والتوثيق السينمائي للمناظر الجبلية.',
      'location': 'صنعاء',
      'equipment': ['SONY A7R IV', 'DRONE'],
      'image': 'assets/images/ai_photographer.jpg',
      'rating': 4.9,
      'portfolio': [
        {
          'url': 'assets/images/portfolio_mountain_1.png',
          'label': 'قمم جبال حراز',
          'description': 'لقطة بانورامية التقطت عند الفجر تظهر المدرجات الزراعية العريقة في جبال حراز، حيث تبرز قرية قديمة بين الضباب الكثيف.'
        },
        {
          'url': 'assets/images/portfolio_mountain_2.png',
          'label': 'تنوع طبيعي فريد',
          'description': 'توثيق مقرب لنباتات المنطقة الجبلية النادرة، يبرز التباين اللوني والقدرة المذهلة للطبيعة على التكيف في الظروف القاسية.'
        },
        {
          'url': 'assets/images/portfolio_mountain_3.png',
          'label': 'طرق جبلية وعرة',
          'description': 'منظور علوي يبرز التحدي الهندسي والطبيعي في شق الطرق عبر الجبال الشاهقة، مما يخلق لوحة تجريدية من صنع الإنسان والطبيعة.'
        },
      ],
    },
    {
      'id': '2',
      'name': 'سارة خالد',
      'specialty': 'خبيرة في تصوير البورتريه والموضة بأسلوب عصري وألوان حيوية.  ',
      'location': 'صنعاء',
      'equipment': ['SONY A7R IV', 'PRIME LENS'],
      'image': 'assets/images/photographer_mohammad_2.png',
      'rating': 4.8,
      'portfolio': [
        {
          'url': 'assets/images/portfolio_fashion_1.jpg',
          'label': 'فن الموضة العصرية',
          'description': 'لقطة تعكس الجرأة في استخدام الألوان والإضاءة النيون، تبرز تفاصيل الأزياء العصرية مع لمسة فنية فريدة.'
        },
        {
          'url': 'assets/images/portfolio_fashion_2.jpg',
          'label': 'بورتريه كلاسيكي متجدد',
          'description': 'تركيز عميق على ملامح الوجه مع إضاءة ناعمة وألوان دافئة، يجمع بين كلاسيكية البورتريه وحيوية العصر.'
        },
      ],
    },
    {
      'id': '3',
      'name': 'محمد خالد',
      'specialty': 'تصوير شارع ومعماري',
      'location': 'صنعاء',
      'equipment': ['LEICA Q2', '35MM'],
      'image': 'assets/images/photographer_mohammad_3.jpg',
      'rating': 4.7,
      'portfolio': [
        {
          'url': 'assets/images/portfolio_product.png',
          'label': 'تصوير منتجات تجاري',
          'description': 'لقطة تجارية احترافية تركز على الإضاءة الدرامية والملمس، مما يعزز من جاذبية الهوية البصرية للمنتج.'
        },
        {
          'url': 'assets/images/portfolio_nature.png',
          'label': 'طبيعة خلابة من اليمن',
          'description': 'توثيق لهدوء الطبيعة في الوديان اليمنية الخضراء خلال موسم الأمطار، بأسلوب سينمائي يبرز عمق الألوان.'
        },
      ],
    },
    {
      'id': '4',
      'name': 'منصور العبدالله',
      'specialty': 'تصوير رياضي',
      'location': 'صنعاء',
      'equipment': ['NIKON Z9', '400MM LENS'],
      'image': 'assets/images/photographer_mansour.png',
      'rating': 4.9,
      'portfolio': [
        {
          'url': 'assets/images/portfolio_street.png',
          'label': 'سباقات الهجن والسرعة',
          'description': 'تجميد لحظات الإثارة في سباقات الهجن التقليدية، مع التركيز على الغبار المتصاعد وتعبيرات القوة والإصرار.'
        },
        {
          'url': 'assets/images/portfolio_nature.png',
          'label': 'تغطية الأحداث الرياضية',
          'description': 'لقطة واسعة تظهر حيوية الملاعب والجمهور، تعكس شغف الشباب اليمني بالرياضة والفعاليات الحركية.'
        },
      ],
    },
  ];

  static final List<Map<String, dynamic>> technicians = [
    {
      'id': '1',
      'name': 'أحمد المنصور',
      'description': 'خبير متخصص في صيانة الكاميرات السينمائية والعدسات الفاخرة مع خبرة تزيد عن ١٠ سنوات.',
      'location': 'الرياض، حي النرجس',
      'tags': ['Camera', 'Lenses'],
      'level': 'Pro',
      'image': 'assets/images/tech_ahmad_cinematic.jpg',
    },
    {
      'id': '2',
      'name': 'سارة القحطاني',
      'description': 'متخصصة في أنظمة الإضاءة المعقدة والدرونز السينمائية. دقة متناهية في التشخيص.',
      'location': 'جدة، شارع التحلية',
      'tags': ['Drone', 'Light'],
      'level': 'Senior',
      'image': 'assets/images/photographer_mohammad_2.png', // Mixing for variety
    },
    {
      'id': '3',
      'name': 'فهد العتيبي',
      'description': 'تقني متمكن في إصلاح معدات الصوت اللاسلكية وأنظمة البث المباشر الميدانية.',
      'location': 'الدمام، المنطقة الشرقية',
      'tags': ['Audio', 'Radio'],
      'image': 'assets/images/photographer_mohammad_3.jpg',
    },
    {
      'id': '4',
      'name': 'عمر خالد',
      'description': 'متخصص في معايرة الألوان وتحديث الأنظمة البرمجية للكاميرات الرقمية الحديثة.',
      'location': 'مكة المكرمة، العزيزية',
      'tags': ['Firmware', 'Color'],
      'image': 'assets/images/tech_ahmad_cinematic.jpg',
    },
  ];
}
