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
      'name': 'أحمد السينمائي',
      'specialty': 'تصوير سينمائي وبورتريه درامي',
      'location': 'الرياض',
      'equipment': ['SONY A7R IV', '35MM GM'],
      'image': 'assets/images/photographer_mohammad_1.jpg',
      'rating': 4.9,
    },
    {
      'id': '2',
      'name': 'سارة خالد',
      'specialty': 'تصوير بورتريه وموضة',
      'location': 'الرياض',
      'equipment': ['SONY A7R IV', 'PRIME LENS'],
      'image': 'assets/images/photographer_mohammad_2.png',
      'rating': 4.8,
    },
    {
      'id': '3',
      'name': 'محمد خالد',
      'specialty': 'تصوير شارع ومعماري',
      'location': 'جدة',
      'equipment': ['LEICA Q2', '35MM'],
      'image': 'assets/images/photographer_mohammad_3.jpg',
      'rating': 4.7,
    },
    {
      'id': '4',
      'name': 'منصور العبدالله',
      'specialty': 'تصوير رياضي',
      'location': 'الشرقية',
      'equipment': ['NIKON Z9', '400MM LENS'],
      'image': 'assets/images/photographer_mohammad_1.jpg',
      'rating': 4.9,
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
