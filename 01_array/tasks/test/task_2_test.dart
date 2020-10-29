import 'package:test/test.dart';
import '../task_2.dart';
import 'dart:io';
import '../../high_array.dart';

/// Modify the method from `task_1.dart` so that the item with the highest key is not only returned by the method,
/// but also removed from the array.
/// Call the method `removeMax()`.

//0. Create class to access data in HighArray file
//1. Find max
//2. Assign an index to know what to delete later
//3. Delete the max(index)

//// check if the array is empty first

class HighArrayTask2 extends HighArray {
  //constructor
  HighArrayTask2(int max) : super(max);
  //method
  int removeMax() {
    int max = a[0];
    int indexMax = 0;
    for (int i = 1; i <nElems; i ++){
      if (a[i]>=max){
        max = a[i];
        indexMax = i;
        print(nElems);

        // nElems.remove();
      }
    }
    for(int k = indexMax; k < nElems - 1; k ++) {
      a[k] = a[k + 1];
    }
    //print(nElems);
    // a[indexMax] = -10000
    nElems --;
    return max;
  }
}




void main() {
    int maxSize = 10; // array size
    HighArrayTask2 array = new HighArrayTask2(maxSize);

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


  array.display();

  stdout.writeln('Second max value is ${array.removeMax()}');

  array.display();
}
