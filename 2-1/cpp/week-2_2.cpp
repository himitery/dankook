#include <iostream>
using namespace std;

int main()
{
    for (register int i = 1; i <= 10; i++)
    {
        for (register int j = 1; j <= i; j++)
            cout << j << "\t";
        cout << endl;
    }
    return 0;
}