#include "help_hench"

void main()
{
    object oPC = GetFirstPC();
    object oBruk = GetNearestObjectByTag("HENCH_BRUK");
    object oExit = GetNearestObjectByTag("WP_EXIT");
    int nReward = GetLocalInt(oPC, GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD");

    if (nReward = 0)
        AdjustAlignment(oPC, ALIGNMENT_GOOD, 5);
    else
        GiveGoldToCreature(oPC, nReward);

    if (GetArea(oBruk) == GetArea(OBJECT_SELF))
    {
        SetLocalInt(oBruk, "N_DONT_SPEAK", 1);
        AssignCommand(oBruk, ActionMoveToObject(oExit));
        DestroyObject(oBruk, 6.0);
    }

    SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 1);
    AssignCommand(OBJECT_SELF, ActionMoveToObject(oExit));
    DestroyObject(OBJECT_SELF, 6.0);
}
