#include <iostream>
#define ARRAY_SIZE 5
using namespace std;

struct point {
    int x, y;
};

int main() {
    point arr[ARRAY_SIZE];
    int distance[ARRAY_SIZE];

    for (int i = 0; i < ARRAY_SIZE; i++) {
        cin >> arr[i].x >> arr[i].y;
        distance[i] = arr[i].x * arr[i].x + arr[i].y * arr[i].y;
    }

    int min_index = -1;
    for (int i = 0; i < ARRAY_SIZE; i++)
        if (min_index == -1 || distance[min_index] > distance[i])
            min_index = i;
    cout << "가장 가까운 좌표값: (" << arr[min_index].x << ", " << arr[min_index].y << ")" << endl;

    return 0;
}