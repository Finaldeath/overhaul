#include "help_hench"

void main()
{
    int iSafe = GetLocalInt(OBJECT_SELF, "iSAFETODESTROY");

    if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1)
    {
        if (GetLocalInt(GetModule(), "N_INTERLUDE") == 1)
        {
            object oWP = GetHenchmanSpawnPoint(GetTag(OBJECT_SELF));

            location lWP = GetLocation(oWP);

            AssignCommand(OBJECT_SELF, ActionMoveToLocation(lWP));
        }
    }

    if (iSafe == TRUE)
    {
        ExecuteScript("conv_sc_tari_04", OBJECT_SELF);
    }
}

