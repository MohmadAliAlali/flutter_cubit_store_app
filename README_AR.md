# Task1 Cubit

مشروع Flutter يهدف كمثال عملي لاستخدام Cubit/Bloc لإدارة الحالة، مع ميزات مساعدة مثل التخزين المحلي عبر Hive، استدعاءات HTTP عبر Dio، وشاشات مهيأة للعرض المتجاوب.

## الوصف

تطبيق نموذجي منظّم بمسارات وطبقة عرض/منطق (presentation/manager)، يستخدم `flutter_bloc` (Cubit) لإدارة الحالة، ويستعمل `Hive` للتخزين المحلي، و`dio` للتعامل مع الشبكات. المشروع يحتوي على أجزاء رئيسية مثل: شريط تنقّل سفلي، قائمة منتجات، سلة مشتريات، عناصر مفضلة، وإعدادات.

## الميزات الرئيسية

- إدارة حالة باستخدام `flutter_bloc` (Cubits).
- تخزين محلي سريع عبر `hive` و `hive_flutter`.
- اتصالات شبكية عبر `dio` مع `pretty_dio_logger` للتصحيح.
- شريط تنقّل سفلي مخصص (`persistent_bottom_nav_bar`، مع تنفيذ مظهر Liquid iOS بسيط).
- دعم شاشات متجاوبة عبر `flutter_screenutil`.
- دعم Device Preview أثناء التطوير.

## المتطلبات

- Flutter SDK >= 3.9.2
- Dart SDK متوافق (مذكور في `pubspec.yaml`).

## التثبيت والتشغيل

1. استنساخ المستودع:

   `git clone git@github.com:MohmadAliAlali/flutter_cubit_store_app.git`

2. الدخول للمجلد:

   `cd "Flutter Project/2025 project/task1_cubit"`

3. تثبيت الحزم:

   `flutter pub get`

4. إذا كنت تستخدم Hive مع مولد النماذج، شغّل:

   `flutter pub run build_runner build --delete-conflicting-outputs`

5. تشغيل التطبيق:

   `flutter run`

ملاحظة: أثناء التطوير يتم تفعيل `DevicePreview` تلقائيًا عندما لا يكون التطبيق في وضع الإصدار.

## بنية المشروع (مختصر)

- `lib/main.dart` — نقطة دخول التطبيق، تهيئة Hive و MultiBlocProvider.
- `lib/core/` — إعدادات عامة: `route`, `storage`, `style`, `navigation`, إلخ.
- `lib/features/` — المكونات الوظيفية مقسمة حسب الميزة، كل ميزة تحتوي على `presentation` (شاشات/ويدجت/مدراء الحالة) وربما `data`/`domain`.
  - مثال: `features/navbar/prisintation/view/wedgit/navbar_wid.dart` يحتوي على تنفيذ شريط التنقل السفلي الخاص بنظام iOS بشكل Liquid بسيط.
- `assets/` — بيانات تجريبية وملفات ثابتة مثل `mock_data/users.json`.

## الحزم المستخدمة (أساسية من `pubspec.yaml`)

- `flutter_bloc` — إدارة الحالة.
- `dio`, `pretty_dio_logger` — اتصالات HTTP ومعالجة السجلات.
- `hive`, `hive_flutter`, `hive_generator` — تخزين محلي ومولدات.
- `flutter_screenutil` — دعم التصميم المتجاوب.
- `persistent_bottom_nav_bar` — عناصر شريط التنقل السفلي.
- `device_preview` — معاينة الجهاز أثناء التطوير.

## نصائح تطويرية

- تفعيل وضع التصحيح في `DevicePreview` مفيد أثناء تطوير واجهات متعددة الدقات.
- حافظ على تشغيل `build_runner` بعد تعديل نماذج Hive لتحديث المحولات.
- استخدم `BlocProvider` و`Cubit` للفصل الواضح بين العرض والمنطق.

## اختبار

تشغيل اختبارات الوحدة (إن وُجدت):

`flutter test`

## بيانات تجريبية

المشروع يحتوي على ملف تجريبي: `assets/mock_data/users.json` يمكن استخدامه لملء واجهات الاختبار أو المحاكاة.

## المساهمة

مرحب بالمساهمات: افتح Issues أو Pull Requests مع وصف واضح للتغييرات وكيفية اختبارها.

## الترخيص

أضف رخصة هنا حسب اختيارك (مثلاً: MIT). إذا لم تحدد رخصة، افترض أن المشروع خاص.

---

ملفات مهمة:

- [pubspec.yaml](pubspec.yaml)
- [lib/main.dart](lib/main.dart)
- [lib/features/navbar/prisintation/view/wedgit/navbar_wid.dart](lib/features/navbar/prisintation/view/wedgit/navbar_wid.dart)

إذا رغبت، أستطيع تحديث README ليشمل أمثلة استخدام أكثر تفصيلاً لكل Cubit أو إضافة قسم توضيحي للـ routes وتهيئة Hive.