#include "help_dream"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        Dream2(oPC);
    }
}
