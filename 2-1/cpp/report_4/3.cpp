#include <iostream>
using std::cout;
using std::endl;

template <class T> int find(T object, T *list, int size) {
  for (int i = 0; i < size; i++)
    if (list[i] == object)
      return i;
  return -1;
}

int main(int argc, char *argv[]) {
  int int_array[] = {1,  2,  3,  4,  5,  6,  7,  8,  9,  10,
                     11, 12, 13, 14, 15, 16, 17, 18, 19, 20};
  float float_array[] = {1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9, 10.01};
  char char_array[] = {'h', 'i', 'm', 'i', 't', 'e', 'r', 'y'};

  cout << "int_array = {";
  for (int i : int_array)
    cout << i << ", ";
  cout << "\b\b}" << endl << endl;

  cout << "find(10, int_array, sizeof(int_array))" << endl;
  cout << "> " << find(10, int_array, sizeof(int_array)) << endl;

  cout << "find(30, int_array, sizeof(int_array))" << endl;
  cout << "> " << find(30, int_array, sizeof(int_array)) << endl;

  cout << endl << endl;

  cout << "float_array = {";
  for (float i : float_array)
    cout << i << ", ";
  cout << "\b\b}" << endl << endl;

  cout << "find((float)3.3, float_array, sizeof(float_array))" << endl;
  cout << "> " << find((float)3.3, float_array, sizeof(float_array)) << endl;

  cout << "find((float)10.2, float_array, sizeof(float_array))" << endl;
  cout << "> " << find((float)10.2, float_array, sizeof(float_array)) << endl;

  cout << endl << endl;

  cout << "char_array = {";
  for (char i : char_array)
    cout << i << ", ";
  cout << "\b\b}" << endl << endl;

  cout << "find('y', char_array, sizeof(char_array))" << endl;
  cout << "> " << find('y', char_array, sizeof(char_array)) << endl;

  cout << "find('a', char_array, sizeof(char_array))" << endl;
  cout << "> " << find('a', char_array, sizeof(char_array)) << endl;

  return 0;
}
