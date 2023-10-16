#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            BlackScreen(oPC);
        }
    }
}
