#include <iostream>
#define ARRAY_SIZE 6
using namespace std;

int main() {
    int arr[ARRAY_SIZE];
    int min_index = -1;

    cout << "입력: ";
    for (int i = 0; i < ARRAY_SIZE; i++) {
        cin >> arr[i];
        if (min_index < 0 || arr[min_index] > arr[i])
            min_index = i;
    }

    cout << arr[min_index];
    for (int i = 1; i < ARRAY_SIZE; i++)
        cout << " " << (i == min_index ? arr[0] : arr[i]);
    cout << endl;

    return 0;
}