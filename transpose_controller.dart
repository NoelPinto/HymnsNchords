import 'package:get/state_manager.dart';

class TransposeController extends GetxController {
  final transpose = 0.obs;
  final chords = "".obs;
  final key = "".obs;
  var transposeIndex = 0;
  String fixedChords = "";

  var allScales = List.generate(12, (i) => List(12), growable: false);

  @override
  void onInit() {
    super.onInit();
  }

  int increaseTransposeCount = 0;
  int fixedTransposeIndex = 0;
  int count, count1;

  void setChords(String chord, String keyLocal) {
    count = 0;
    count1 = 0;
    increaseTransposeCount = 0;
    chords(chord);
    key(keyLocal);
    allScales[0] = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
    allScales[1] = ['C#', 'D#', 'E#', 'F#', 'G#', 'A#', 'B#'];
    allScales[2] = ['D', 'E', 'F#', 'G', 'A', 'B', 'C#'];
    allScales[3] = ['E♭', 'F', 'G', 'A♭', 'B♭', 'C', 'D', 'E♭'];
    allScales[4] = ['E', 'F#', 'G#', 'A', 'B', 'C#', 'D#'];
    allScales[5] = ['F', 'G', 'A', 'B♭', 'C', 'D', 'E'];
    allScales[6] = ['F#', 'G#', 'A#', 'B', 'C#', 'D#', 'E'];
    allScales[7] = ['G', 'A', 'B', 'C', 'D', 'E', 'F#'];
    allScales[8] = ['A♭', 'B♭', 'C', 'D♭', 'E♭', 'F', 'G'];
    allScales[9] = ['A', 'B', 'C#', 'D', 'E', 'F#', 'G#'];
    allScales[10] = ['B♭', 'C', 'D', 'E♭', 'F', 'G', 'A'];
    allScales[11] = ['B', 'C#', 'D#', 'E', 'F#', 'G#', 'A#'];

    String newInput = "";
    int skip = 0;
    for (int i = 0; i < chords.value.length; i++) {
      if (chords.value[i] == '_' && skip == 0) {
        newInput += '\n';
        skip = 1;
      } else if (skip > 0) {
        skip--;
      } else
        newInput += chords.value[i];
    }
    chords.value = newInput;

    for (int i = 0; i < allScales.length; i++) {
      if (key == allScales[i][0]) {
        transposeIndex = i;
        break;
      }
    }
    fixedTransposeIndex = transposeIndex;
    fixedChords = newInput;
  }

  void changeKey() {
    String newKey = "";
    int val = transpose.value;

    if ((transposeIndex + val) < 0) val = 12 + val;

    if (transposeIndex + val >= 12) {
      val = -transposeIndex + count;
      count++;
    } else
      count = 0;

    newKey = allScales[transposeIndex + val][0];
    key.value = newKey;
    //print(newKey);
  }

  void increaseTranspose() {
    if (transpose.value != 12) {
      transpose.value++;
      changeKey();
      changeChords(++increaseTransposeCount);
    }
  }

  void decreaseTranspose() {
    if (transpose.value != -12) {
      transpose.value--;
      changeKey();
      changeChords(--increaseTransposeCount);
    }
  }

  void changeChords(int increaseTransposeCount) {
    String newInput = fixedChords;

    if ((increaseTransposeCount + fixedTransposeIndex) < 0)
      increaseTransposeCount = 12 + increaseTransposeCount;

    if ((increaseTransposeCount + fixedTransposeIndex) >= 12) {
      increaseTransposeCount = -fixedTransposeIndex + count1;
      count1++;
    } else
      count1 = 0;

    String result = "";
    int skip1 = 0;

    for (int i = 0; i < newInput.length; i++) {
      String currentChord = "";
      String newChord = "";

      if (newInput[i] == '[' || newInput[i] == '/') {
        skip1 = 1;

        if (newInput[i] == '[')
          result += '[';
        else
          result += '/';

        if (newInput[i + 2] == "#" || newInput[i + 2] == "♭") {
          currentChord += newInput.substring(i + 1, i + 3);
          skip1 = 2;
        } else
          currentChord += newInput[i + 1];

        for (int j = 0; j < 7; j++) {
          if (currentChord.compareTo(allScales[fixedTransposeIndex][j]) == 0) {
            newChord +=
                allScales[fixedTransposeIndex + increaseTransposeCount][j];
            result += newChord;
            break;
          }
        }
      } else if (skip1 > 0)
        skip1--;
      else
        result += newInput[i];
    }
    chords.value = result;
  }
}
