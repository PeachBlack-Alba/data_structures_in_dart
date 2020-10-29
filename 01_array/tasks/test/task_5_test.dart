import 'package:test/test.dart';

import '../../ordered_array.dart';
import '../task_5.dart';





// set an index to the top of two arrays ind 1 ind2
// Create an array arr3[] of size n1 + n2.
// 1. set variables for: getValueAt and setValueAt
// 2. Pick smaller of current elements in arr1[] and arr2[],
// copy this smaller element to next position in arr3[] and move ahead in arr3[] and the array whose element is picked.
// 3. If there are remaining elements in arr1[] or arr2[], copy them also in arr3[].

class OrderedArrayTask5 extends OrderedArray {
  OrderedArrayTask5(int max)
      : super(max);

  //get index
  int getValueAt(int index) {
    return a[index];
  }
//get value
  void setValueAt(int index, int value) {
    a[index] = value;
  }

  static OrderedArrayTask5 merge(OrderedArrayTask5 source_one, OrderedArrayTask5 source_two) {
    final int length = source_one.size() + source_two.size();

    OrderedArrayTask5 arr3 = new OrderedArrayTask5(length);

    // initialize values of 3 arrays
    int i = 0, j = 0, k = 0;

    while (i < source_one.size() && j < source_two.size()){
      //check current element of first array is < than current element of 2nd array
      if( source_one.getValueAt(i) <= source_two.getValueAt(j)){
        // if element first array is smaller , assign it to the array3
        // set value to the index k (first array 3), value the element we checked was smaller
        arr3.setValueAt(k, source_one.getValueAt(i));
        //adds the element
        i ++;
    } else {
      // if the element of arr1 is not smaller than element arr2, means element arr1 is bigger,
        // therefore, we do the same but to the element arr2
        // set value to the index k (first array 3), value the element we checked was smaller (arr2)
        arr3.setValueAt(k,source_two.getValueAt(j));
        //adds the element
        j ++;
      }
      arr3.nElems ++;
      k++;
    }

    // as long as the array is not empty, keep looping and adding the nElems
    while (i < source_one.size()) {
      arr3.setValueAt(k, source_one.getValueAt(i));
      arr3.nElems ++;
      k ++;
      j ++;
      i ++;
    }

    while (j < source_two.size()) {
      arr3.setValueAt(k, source_two.getValueAt(j));
      arr3.nElems ++;
      k ++;
      j ++;
      i ++;
    }
    return arr3;
  }
}





void main() {
  OrderedArrayTask5 source_one;
  OrderedArrayTask5 source_two;

  setUp(() {
    int maxArraySize = 5;
    source_one = new OrderedArrayTask5(maxArraySize);
    source_two = new OrderedArrayTask5(maxArraySize);

    source_one.insert(59);
    source_one.insert(12);
    source_one.insert(90);
    source_one.insert(45);
    source_one.insert(3);

    source_two.insert(100);
    source_two.insert(7);
    source_two.insert(46);
    source_two.insert(14);
    source_two.insert(17);
  });

  group('OrderedArrayTask5', () {
    test('.merge() should merge two equal length array without duplicates', () {
      OrderedArrayTask5 result = OrderedArrayTask5.merge(source_one, source_two);

      expect(result.a, equals([3, 7, 12, 14, 17, 45, 46, 59, 90, 100]));
      expect(result.nElems, equals(10));
    });

    test('.merge() should merge two different length array without duplicates', () {
      source_one = new OrderedArrayTask5(8);

      source_one.insert(59);
      source_one.insert(12);
      source_one.insert(90);
      source_one.insert(45);
      source_one.insert(3);
      source_one.insert(10);
      source_one.insert(67);
      source_one.insert(38);

      OrderedArrayTask5 result = OrderedArrayTask5.merge(source_one, source_two);

      expect(result.a, equals([3, 7, 10, 12, 14, 17, 38, 45, 46, 59, 67, 90, 100]));
      expect(result.nElems, equals(13));
    });

    test('.merge() should merge two different lenght array with duplicated', () {
      source_one = new OrderedArrayTask5(8);

      source_one.insert(59);
      source_one.insert(12);
      source_one.insert(90);
      source_one.insert(46);
      source_one.insert(7);
      source_one.insert(10);
      source_one.insert(17);
      source_one.insert(38);

      OrderedArrayTask5 result = OrderedArrayTask5.merge(source_one, source_two);
      expect(result.a, equals([7, 7, 10, 12, 14, 17, 17, 38, 46, 46, 59, 90, 100]));
      expect(result.nElems, equals(13));
    });

  });
}
