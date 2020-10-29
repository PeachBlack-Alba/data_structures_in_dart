import 'dart:core';

import 'package:test/test.dart';
import '../../high_array.dart';
import '../task_6.dart';

/// Write a `noDups()` method for the `HighArray` class of the `high_array.dart` program.
/// This method should remove all duplicates from the array.
/// That is, if three items with the key 17 appear in the array, `noDups()` should remove two of them.
/// Don’t worry about maintaining the order of the items.
/// One approach is to first compare every item with all the other items and
/// overwrite any duplicates with a null (or a distinctive value that isn’t used for real keys).
/// Then remove all the nulls. Of course, the array size will be reduced.

// 1. Create a new empty String
// 2. We are going to use that String to trim it do there is no white spaces in the array
// because noDups delete the value but not the index
// 3. Therefore we will need to return the new lenght of the array, thats why we need to delete empty indexes too
// 4. Create a slow pointer and a fast pointer
// 5. Slow pointer will stat in index 0 and compare with fast pointer if number is equal to it
// 6. If the value is equal, slow pointer stays, fast pointer, index +1.
// 7. If the value is not equal, slow pointer moves +1 position and adds the value, fast pointer moves fowards too

// 1,3,4,4,5,2
// 1 (slow pointer), 3 (fast pointer), 4, 4, 5, 2,
// 1 , 3(slow pointer) , 4(fast pointer), 4, 5, 2,
// 1 , 3 , 4(slow pointer), 4 (fast pointer), 5, 2,
// 1 , 3 , 4, 4(slow pointer), 5(fast pointer), 2,
// 1,3,4,5,4,2
// 1 , 3 , 4, 4, 5(slow pointer), 2(fast pointer)
// 1,3,4,5,2,4

// 8. Return the lenght without duplicates

class HighArrayTask6 extends HighArray {
  HighArrayTask6(int max) : super(max);
  List<int> a; // ref to array a
  int nElems; // number of data items
  int value = null;

}

class Solution {
  List<int> nums = [89, 10, 15, 17, 35, 10, 38, 15, 38, 90];

  void RemoveDuplicates() {
    int i = 0;
    // fast pointer will keep moving and starts from the 2nd place
    for (int j = 1; j < nums.length; j++) {
      if (nums[i] != nums[j]) {
        // if they are not equal add the value to the position +1
        nums[i++] = nums[j];
      }
    }
    return i + 1;
  }
}

void main() {
  HighArrayTask6 highArrayTask6;

  setUp(() {
    int maxArraySize = 10;
    highArrayTask6 = new HighArrayTask6(maxArraySize);

    highArrayTask6.insert(89);
    highArrayTask6.insert(10);
    highArrayTask6.insert(15);
    highArrayTask6.insert(17);
    highArrayTask6.insert(35);
    highArrayTask6.insert(10);
    highArrayTask6.insert(38);
    highArrayTask6.insert(15);
    highArrayTask6.insert(38);
    highArrayTask6.insert(90);
  });

  group('HighArrayTask6', () {
    test('.noDups() should remove 3 element', () {
      highArrayTask6.noDups();
      expect(highArrayTask6.toString(), equals('89 10 15 17 35 38 90'));
      expect(highArrayTask6.nElems, equals(7));
    });
  });
}
