// بيانات جميع العقارات للشبكة
import '../../../../core/entities/property_entity.dart';

// بيانات عقارات تجريبية لاستخدامها في التطبيق
List<PropertyEntity> dummyProperties() => [
  PropertyEntity(
    id: 4,
    title: 'شقة بإطلالة رائعة',
    description:
        'شقة بإطلالة رائعة في حي الورود، الرياض، قريبة من جميع الخدمات.',
    price: 45345358.0,
    status: "للبيع",
    city: 'الرياض',
    address: 'حي الورود',
    isFeatured: false,
    bedrooms: 2,
    bathrooms: 2,
    area: "120 م",
    image:
        'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=400&h=300&fit=crop',
    images: [],
  ),
  PropertyEntity(
    id: 4,
    title: 'شقة بإطلالة رائعة',
    description:
        'شقة بإطلالة رائعة في حي الورود، الرياض، قريبة من جميع الخدمات.',
    price: 45345358.0,
    status: "للبيع",
    city: 'الرياض',
    address: 'حي الورود',
    isFeatured: false,
    bedrooms: 2,
    bathrooms: 2,
    area: "120 م",
    image:
        'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=400&h=300&fit=crop',
    images: [],
  ),
];
//
// List<PropertyTestModel> dummyProperties() => [
//   PropertyTestModel(
//     id: 4,
//     title: 'شقة بإطلالة رائعة',
//     price: '3,200 ريال/شهر',
//     location: 'حي الورود، الرياض',
//     imageUrl:
//         'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=400&h=300&fit=crop',
//     beds: 2,
//     baths: 2,
//     area: 120,
//     type: PropertyType.rent,
//   ),
//   PropertyTestModel(
//     id: 5,
//     title: 'فيلا حديثة التصميم',
//     price: '4,200,000 ريال',
//     location: 'حي الياسمين، الرياض',
//     imageUrl:
//         'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=400&h=300&fit=crop',
//     beds: 6,
//     baths: 5,
//     area: 520,
//     type: PropertyType.sale,
//   ),
//   PropertyTestModel(
//     id: 6,
//     title: 'شقة استثمارية ممتازة',
//     price: '2,800 ريال/شهر',
//     location: 'حي السليمانية، الرياض',
//     imageUrl:
//         'https://images.unsplash.com/photo-1600566753190-17f0baa2a6c3?w=400&h=300&fit=crop',
//     beds: 3,
//     baths: 2,
//     area: 150,
//     type: PropertyType.rent,
//   ),
//   PropertyTestModel(
//     id: 7,
//     title: 'دوبلكس فاخر',
//     price: '2,900,000 ريال',
//     location: 'حي الربوة، الرياض',
//     imageUrl:
//         'https://images.unsplash.com/photo-1600573472592-401b489a3cdc?w=400&h=300&fit=crop',
//     beds: 4,
//     baths: 4,
//     area: 380,
//     type: PropertyType.sale,
//   ),
//   PropertyTestModel(
//     id: 8,
//     title: 'استوديو عصري',
//     price: '1,800 ريال/شهر',
//     location: 'حي الأندلس، الرياض',
//     imageUrl:
//         'https://images.unsplash.com/photo-1600607687644-c7171b42498b?w=400&h=300&fit=crop',
//     beds: 1,
//     baths: 1,
//     area: 65,
//     type: PropertyType.rent,
//   ),
//   PropertyTestModel(
//     id: 9,
//     title: 'منزل تقليدي جميل',
//     price: '1,650,000 ريال',
//     location: 'حي الدرعية، الرياض',
//     imageUrl:
//         'https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?w=400&h=300&fit=crop',
//     beds: 4,
//     baths: 3,
//     area: 280,
//     type: PropertyType.sale,
//   ),
// ];
