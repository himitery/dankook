#include <iostream>
using namespace std;

int main() {
    int arr_size, *arr;
    cout << "배열의 크기: ";
    cin >> arr_size;

    arr = new int[arr_size];
    cout << arr_size << "개의 수: ";
    for (int i = 0; i < arr_size; i++)
        cin >> arr[i];

    for (int i = 0; i < arr_size; i++) {
        int count = 0;
        for (int j = 0; j < arr_size; j++)
            if (arr[i] > arr[j])
                count++;
        cout << arr[i] << " --> " << count << endl;
    }
    return 0;
}