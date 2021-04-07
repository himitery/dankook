#include <iostream>
#include <stdlib.h>
#define DEFAULT_ARRAY_SIZE 80
using namespace std;

float avg(float *, int);

int main(int argc, char **argv) {
    float result;
    if (argc >= 2) {
        float arr[argc - 1];
        for (register int i = 1; i < argc; i++)
            arr[i - 1] = atof(argv[i]);
        result = avg(arr, argc - 1);
    } else {
        int index = 0;
        float arr[DEFAULT_ARRAY_SIZE];
        cout << "Press 0 to stop" << endl;
        do {
            cin >> arr[index];
            if (arr[index++] == 0)
                break;
        } while (index < DEFAULT_ARRAY_SIZE);
        result = avg(arr, index - 1);
    }
    cout << "avg function returns: " << result << endl;
    return 0;
}

float avg(float *arr, int n) {
    float sum = 0;
    for (register int i = 0; i < n; i++)
        sum += arr[i];
    return sum / n;
}
