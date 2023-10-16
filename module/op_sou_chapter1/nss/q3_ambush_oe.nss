//::///////////////////////////////////////////////
//:: Gnoll ambush trigger on-enter
//:: q3_ambush
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the alarm has been triggered:
    - open the doors
    - bring in the gnolls (4 total)
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 25/2/2003
//:://////////////////////////////////////////////

/*
values for Q3_GNOLL_STATUS:

GNOLL_STATUS_INIT =             initial status
GNOLL_STATUS_LEFT =             all gnoll left the area
GNOLL_STATUS_DEAD =             chief is dead
GNOLL_STATUS_SAFE_PASSAGE =     gnollsgave safe passge
GNOLL_STATUS_CONTROL_TRIBE =     player has full control over the tribe

values for Q3_GNOLL_HELP

GNOLL_NOHELP
GNOLL_HELP
*/


#include "q3_inc_plot"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    if (GetStealthMode(oPC) == STEALTH_MODE_ACTIVATED)
        return;

    int nAlarmStatus = GetLocalInt(GetArea(OBJECT_SELF), "Q3_ALARM_STATUS");
    if(nAlarmStatus == 0) // alarm not activated
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    int nStatus = GetLocalInt(GetModule(), "Q3_GNOLL_STATUS");
    if(nStatus == GNOLL_STATUS_SAFE_PASSAGE || nStatus == GNOLL_STATUS_CONTROL_TRIBE || nStatus == GNOLL_STATUS_LEFT || nStatus == GNOLL_STATUS_DEAD)
        return;

    int nHelp = GetLocalInt(GetModule(), "Q3_GNOLL_HELP");
    if (nHelp == GNOLL_HELP)
        return;

    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oDoor1 = GetNearestObjectByTag("Q3_GNOLL_AMBUSH_DOOR", OBJECT_SELF, 1);
    object oDoor2 = GetNearestObjectByTag("Q3_GNOLL_AMBUSH_DOOR", OBJECT_SELF, 2);

    //SetLocked(oDoor1, FALSE);
    //SetLocked(oDoor2, FALSE);
    AssignCommand(oDoor1, ActionOpenDoor(oDoor1));
    AssignCommand(oDoor1, ActionOpenDoor(oDoor2));

    int n = 1;
    object oGnoll;
    for(n = 1; n <= 4; n++)
    {
        oGnoll = GetNearestObjectByTag("Q3_GNOLL_AMBUSHER", OBJECT_SELF, n);
        DelayCommand(1.0, AssignCommand(oGnoll, ActionForceMoveToObject(OBJECT_SELF, TRUE, 1.0, 4.0)));
        DelayCommand(6.0, AssignCommand(oGnoll, ActionAttack(oPC)));
        if(oGnoll == OBJECT_INVALID)
            return;
    }


}
