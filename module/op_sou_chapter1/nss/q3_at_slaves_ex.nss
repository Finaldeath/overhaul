// all slaves leave to exit
//set module variable "q3_Blumberg_Refugees" to 1

#include "q3_inc_plot"

void main()
{
    object oWP1 = GetWaypointByTag("Q3A_WP_SLAVES_ESCAPE1");
    object oWP2 = GetWaypointByTag("Q3A_WP_SLAVES_ESCAPE2");
    SetPlot("Q3_JOURNAL_GNOLL_SLAVES", 100, GetPCSpeaker());
    SetLocalInt(GetModule(), "q3_Blumberg_Refugees", 1);
    object oDoor = GetNearestObjectByTag("Q3_SLAVES_DOOR");
    SetLocked(oDoor, FALSE);
    DelayCommand(3.0, AssignCommand(oDoor, ActionOpenDoor(oDoor)));

    int i = 1;
    ClearAllActions();
    ActionForceMoveToObject(oWP1, TRUE);
    ActionForceMoveToObject(oWP2, TRUE);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    object oSlave = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);
    while(oSlave != OBJECT_INVALID)
    {
        i++;
        string sTag = GetTag(oSlave);
        if(sTag == "Q3_SLAVE")
        {
            AssignCommand(oSlave, ClearAllActions());
            AssignCommand(oSlave, ActionForceMoveToObject(oWP1, TRUE));
            AssignCommand(oSlave, ActionForceMoveToObject(oWP2, TRUE));
            AssignCommand(oSlave, ActionDoCommand(DestroyObject(oSlave)));
            AssignCommand(oSlave, SetCommandable(FALSE, oSlave));
        }
        oSlave = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);
    }


}
