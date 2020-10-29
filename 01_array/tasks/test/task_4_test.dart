import 'package:test/test.dart';
import '../../ordered_array.dart';

import '../task_4.dart';

class OrderedArrayTask4 extends OrderedArray {
  List<int> a;
  int nElems;

  // Constructor
  OrderedArrayTask4(int max)
      : super(max);

  void insert(int value) {
    int min = 0;
    int max = nElems - 1;
    int j; // j is the index of the half
    // j becomes the middle point of the search interval every time the while loop runs (guess point)

    while (true) {
      if (min > max) break;
      j = (min + max) ~/ 2;
      if (a[j] < value) { // value is the argument of insert function
        // if the value of the middle point of the search is less than the value, we add one point to the min so we change the search range
        min = j + 1;
        // add one to the guess
        j ++;
      } else {
        max = j - 1;
      }
    }
    // for adding a number

    for (int k = nElems; k > j; k--) {
      // replace the value of the 'a' array in the position 'k' for the value in the array position 'k-1'
      a[k] = a[k - 1];
    }
    a[j] = value;
    nElems++;
  }


  void main() {
    OrderedArrayTask4 orderedArray;
    setUp(() {
      int maxArraySize = 10;

      orderedArray = new OrderedArrayTask4(maxArraySize);

      // insert 10 elements
      orderedArray.insert(8);
      orderedArray.insert(4);
      orderedArray.insert(10);
      orderedArray.insert(55);
      orderedArray.insert(32);
      orderedArray.insert(18);
      orderedArray.insert(50);
      orderedArray.insert(90);
      orderedArray.insert(14);
      orderedArray.insert(0);
    });

    group('OrderedArrayTask4', () {
      test('.insert() put element in right position', () {
        expect(orderedArray.a, equals([0, 4, 8, 10, 14, 18, 32, 50, 55, 90]));
        expect(orderedArray.nElems, 10);
      });
      test('.delete() remove element by key and return true', () {
        expect(orderedArray.delete(14), equals(true));
        expect(orderedArray.nElems, equals(9));
      });
      test('.delete() return false if element not found', () {
        expect(orderedArray.delete(105), equals(false));
        expect(orderedArray.nElems, equals(10));
      });
    });
  }
}