import 'package:test/test.dart';
import '../task_3.dart';
import 'dart:io';
import '../../high_array.dart';

/// The removeMax() method in `task_2.dart` suggests a way to sort the contents of an array by key value.
/// Implement a sorting scheme that does not require modifying the HighArray class, but only the code in main().
/// You’ll need a second array, which will end up inversely sorted.
/// (This scheme is a rather crude variant of the selection sort in Chap03, 'Simple Sorting.)


// 1. find max
// 2. Assign a index to max
// 3. Loop from the index until the penultima posicion
// 4. Change that number in that position for the last one (33)
// 5. Delete last number.


class HighArrayTask3 extends HighArray {
  HighArrayTask3(int max): super(max);

  int removeMax() {
    int max = a[0];
    int indexMax = 0;

    for ( int i = 0; i < nElems; i ++){
      if (a[i]>max){
        max=a[i];
        indexMax=i;
      }
    }

    for(int k = indexMax; k < nElems - 1; k ++) {
      a[k] = a[k + 1];
    }
    nElems --;
    return max;
  }
}



void main() {
  int maxSize = 11; // array size
  HighArrayTask3 array = new HighArrayTask3(maxSize);


    array.insert(10);
    array.insert(44);
    array.insert(30);
    array.insert(22);
    array.insert(88);
    array.insert(94);
    array.insert(2);
    array.insert(66);
    array.insert(3);
    array.insert(99);

    // Display items
    array.display();

    int length = array.nElems;
    HighArray orderedArray = new HighArray(maxSize);
    for(int i = 0; i < length; i++) {
      int item = array.removeMax();
      array.display();
      orderedArray.insert(item);
    }

   orderedArray.display();
  }
