#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    object oWP = GetWaypointByTag("WP_PLAC_TRDR_ST_1_NGTCRW");

    location lWP = GetLocation(oWP);

    SceneSpeak(oPC, "[Mikel quickly ushers his men to enter the passage below the trapdoor, and motions for you to do the same...]");

    int nPayment = GetLocalInt(oPC, GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD");

    if (nPayment > 0)
        AssignCommand(OBJECT_SELF, TakeGoldFromCreature(nPayment, oPC));

    object oTrapdoor = GetNearestObjectByTag("PLAC_TRDR_ST_1_NGTCRW");

    SetLocked(oTrapdoor, FALSE);

    AssignCommand(oTrapdoor, PlayAnimation(ANIMATION_PLACEABLE_OPEN));

    object o = GetFirstObjectInArea();

    while (o != OBJECT_INVALID)
    {
        if (GetFactionEqual(o))
        {
            SetLocalInt(o, "N_DONT_SPEAK", 1);

            AssignCommand(o, ActionMoveToObject(oTrapdoor));

            DelayCommand(2.0, AssignCommand(o, JumpToLocation(lWP)));
        }

        o = GetNextObjectInArea();
    }
}
