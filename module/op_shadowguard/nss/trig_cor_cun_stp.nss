#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object o = GetFirstObjectInArea();

            while (o != OBJECT_INVALID)
            {
                if (GetTag(o) == "ENC_FALL_ONES_WITS")
                    SetLocalInt(o, "N_ACTIVE", 1);

                o = GetNextObjectInArea();
            }
        }
    }
}
