#include "help_conv"
#include "help_general"

void RoamingWalk(object o)
{
    AssignCommand(o, ClearAllActions());

    AssignCommand(o, ActionRandomWalk());
}

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(OBJECT_SELF, "N_DONT_RAND") == 0)
    {
        int nNumber = GetLocalInt(GetModule(), "N_COMM_MAX_RAND");

        int nRandom = Random(nNumber);

        SetSelfTalkLevelInt(OBJECT_SELF, nRandom);

        // SPECIAL STAGE 1 Ghaarak Commoner behavior
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1 && GetTag(GetArea(OBJECT_SELF)) == "AREA_CITY_GHAA_DIST_MARK")
            AssignCommand(OBJECT_SELF, DelayCommand(1.5, ActionMoveAwayFromObject(oPC, TRUE, 10.0)));

        // otherwise, typical random walk
        else
        {
            DelayCommand(5.0, RoamingWalk(OBJECT_SELF));
        }
    }
    return FALSE;
}
