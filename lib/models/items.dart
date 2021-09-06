class ItemCategory {
  final String id;
  final String title;
  final String image;

  const ItemCategory({
    required this.id,
    required this.title,
    required this.image,
  });
}

const Item_Category = const [
  ItemCategory(
    id: '1',
    title: 'T-Shirts',
    image:
        'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1621283211-t-shirts-3sixteen-1621282716.jpg',
  ),
  ItemCategory(
    id: '2',
    title: 'Shirts',
    image:
        'https://cdn.shopclues.com/images1/thumbnails/88017/640/1/138854428-88017481-1527669982.jpg',
  ),
];
