// set global for kobolds help in gnoll fight.

#include "q3_inc_plot"

void main()
{
    //SetLocalInt(GetModule(), "Q3_KOBOLDS_STATUS", 3);
    SetPlot("Q3_JOURNAL_KOBOLD_PRISONERS", 100, GetPCSpeaker());
    object oWP = GetWaypointByTag("Q3A_WP_KOBOLDS_SEARCH");
    ClearAllActions();
    ActionForceMoveToObject(oWP, TRUE);
    //ActionDoCommand(DestroyObject(OBJECT_SELF));
    int i;
    object oKobold;
    for(i = 1; i <= 8; i++)
    {
        oKobold = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_REPTILIAN, OBJECT_SELF, i);
        AssignCommand(oKobold, ClearAllActions());
        AssignCommand(oKobold, ActionForceMoveToObject(oWP, TRUE));
        AssignCommand(oKobold, ActionDoCommand(SetLocalInt(oKobold, "Q3_LOOK_FOR_WEAPONS", 1)));
    }
}
