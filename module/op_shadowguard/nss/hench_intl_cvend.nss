#include "help_hench"

void main()
{
    object oWP;
    location lWP;

    if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1)
    {
        if (GetLocalInt(GetModule(), "N_INTERLUDE") == 1)
        {
            oWP = GetHenchmanSpawnPoint(GetTag(OBJECT_SELF));
            lWP = GetLocation(oWP);

            AssignCommand(OBJECT_SELF, ActionMoveToLocation(lWP));
        }
    }
}

