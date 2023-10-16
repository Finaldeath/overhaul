// have all nearby kobolds go to WP and disappear

#include "q3_inc_plot"

void main()
{
    object oWP = GetWaypointByTag("Q3A_WP_KOBOLDS_EXIT_JAIL");
    //SetLocalInt(GetModule(), "Q3_KOBOLDS_STATUS", 2);
    SetPlot("Q3_JOURNAL_KOBOLD_PRISONERS", 90, GetPCSpeaker());

    // handle Nafeeli status to be used in the dragon caves:
    int nStatus = GetLocalInt(GetModule(), "q5_Nafeeli_Status");
    if(nStatus == 0)
        SetLocalInt(GetModule(), "q5_Nafeeli_Status", 1); //escaped status

    ClearAllActions();
    ActionForceMoveToObject(oWP, TRUE);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    int i;
    object oKobold;
    for(i = 1; i <= 8; i++)
    {
        oKobold = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_REPTILIAN, OBJECT_SELF, i);
        if(oKobold == OBJECT_INVALID)
            return;
        SetLocalInt(oKobold, "Q3_MOVING", 1);
        AssignCommand(oKobold, ClearAllActions());
        AssignCommand(oKobold, ActionForceMoveToObject(oWP, TRUE));
        AssignCommand(oKobold, ActionDoCommand(DestroyObject(oKobold)));
        //SetCommandable(FALSE, oKobold);
    }
    //SetCommandable(FALSE, OBJECT_SELF);

}
