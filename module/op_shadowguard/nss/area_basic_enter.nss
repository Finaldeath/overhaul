#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetObjectInt(OBJECT_SELF, "N_DO_ONCE") == 0)
        {
            SetObjectInt(OBJECT_SELF, "N_DO_ONCE", 1);
        }
    }
}
