import 'package:equatable/equatable.dart';

const List<String> _specialitiesEN = [
  'Accident and emergency medicine',
  'Allergology',
  'Anaesthetics',
  'Cardiology',
  'Craniofacial surgery',
  'Dermatology',
  'Endocrinology',
  'Family and General Medicine',
  'Gastroenterologic surgery',
  'Gastroenterology',
  'General surgery',
  'Geriatrics',
  'Hematology',
  'Immunology',
  'Infectious diseases',
  'Internal medicine',
  'Nephrology',
  'Neuropsychiatry',
  'Neurology',
  'Neurosurgery',
  'Nuclear medicine',
  'Obstetrics and gynaecology',
  'Occupational medicine',
  'Oncology',
  'Ophthalmology',
  'Oral and maxillofacial surgery',
  'Orthopaedics',
  'Otorhinolaryngology',
  'Paediatric surgery',
  'Paediatrics',
  'Pathology',
  'Physical medicine and rehabilitation',
  'Plastic surgery',
  'Psychiatry',
  'Public health',
  'Radiation Oncology',
  'Radiology',
  'Respiratory medicine',
  'Rheumatology',
  'Thoracic surgery',
  'Tropical medicine',
  'Urology',
  'Vascular surgery',
  'Venereology',
];

const List<String> _specialitiesAR = [
  'طب الطوارئ',
  'الحساسية',
  'التخدير',
  'القلب',
  'جراحة الوجه و الفكين',
  'الجلدية',
  'الغدد الصماء',
  'طب الأسرة',
  'جراحة الجهاز الهضمي',
  'الجهاز الهضمي',
  'الجراحة العامة',
  'طب المسنين',
  'أمراض الدم',
  'المناعة',
  'الأمراض المعدية',
  'الأمراض الباطنة',
  'الكلي',
  'النفسية و العصبية',
  'الأمراض العصبية',
  'جراحة المخ و الأعصاب',
  'الطب النووي',
  'النساء و التوليد',
  'طب الصناعات',
  'الأورام',
  'الرمد',
  'الأسنان',
  'جراحة العظام',
  'جراحة الأنف و الأذن و الحنجرة',
  'جراحة الأطفال',
  'الأطفال',
  'الباثولوجي و الأنسجة',
  'العلاج الطبيعي و التأهيل',
  'جراحة التجميل',
  'الأمراض النفسية',
  'الصحة العامة',
  'العلاج الإشعاعي',
  'الأشعة',
  'الأمراض الصدرية',
  'الروماتيزم',
  'جراحة القلب و الصدر',
  'الأمراض المتوطنة',
  'جراحة المسالك البولية',
  'جراحة الأوعية الدموية',
  'أمراض الذكورة',
];

class Speciality extends Equatable {
  const Speciality({
    required this.en,
    required this.ar,
    required this.id,
  });
  final String en;
  final String ar;
  final int id;

  // static List<Speciality> get list {
  //   return _specialitiesEN.map((e) {
  //     return Speciality(
  //       en: e,
  //       ar: _specialitiesAR.elementAt(_specialitiesEN.indexOf(e)),
  //     );
  //   }).toList();
  // }

  Map<String, dynamic> toJson() {
    return {
      "spec_id": id,
      'speciality_en': en,
      'speciality_ar': ar,
    };
  }

  @override
  List<Object?> get props => [en, ar, id];
}
