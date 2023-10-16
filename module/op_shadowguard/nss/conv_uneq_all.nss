#include "help_inventory"

void main()
{
    int i;

    for (i = 0; i < 100; i++)
        CustomUnequipItem(OBJECT_SELF, i);
}
