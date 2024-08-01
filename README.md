# Blurme - render object blur widget

Instead of using **Strack** with **BackdropFilter.blur** you could use Render object implementation for blurring.

## Benefits

1. Rendering speed increased about 20-30% on average
2. Single widget instead of multiple ones

---

## Measurements

Difference was measured in example.dart file.

1. First row - initial app start and first widget render
2. Second row - blur equals to 0 in both widgets
3. Third row and further - random measures while changing slider value for blurriness

| Stack+BackdropFilter (microseconds) | Render Object (microseconds) |
| :---------------------------------- | :--------------------------- |
| 5309                                | 315                          |
| 155                                 | 70                           |
| 99                                  | 72                           |
| 90                                  | 62                           |
| 86                                  | 64                           |
| 89                                  | 54                           |
| 81                                  | 120                          |
| 88                                  | 60                           |

As you can see vast majority of times in the test was better for **Render Object** around **20-30%** and if you have your blur level at 0 then it have **50-75%** increase.

## How to use

1. Install package
   `flutter pub add blurme`
2. Pub get
   `flutter pub get`
3. Import it
   `import 'package:blurme/blurme.dart';`
4. Wrap widget with blur and set its value
   `child: Blurme(blurriness: 5, child: const YourChildWidget())...`
