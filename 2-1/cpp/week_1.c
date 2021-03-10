#include <stdio.h>

int find_trivial_divisor(int target_num, int num);

int main(void)
{
    int num = 0;
    int count = 0;

    printf("> ");
    scanf("%d", &num);

    for (register int i = 1; i <= num; i++)
    {
        if (find_trivial_divisor(num, i))
        {
            printf("%d ", i);
            count++;
        }
    }
    printf("\n");
    printf("%d개\n", count);
}

int find_trivial_divisor(int target_num, int num)
{
    if (target_num % num == 0)
        return 1;
    else
        return 0;
}