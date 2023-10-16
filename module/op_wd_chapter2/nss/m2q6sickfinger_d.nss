//::///////////////////////////////////////////////
//:: User Defined
//:: m2q6Sickfinger_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sickfinger tries to sound the alarm.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 15, 2001
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    object oPC = GetNearestPC();
    object oGong = GetNearestObjectByTag("M2Q06PGONG");
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 600:
            AdjustReputation(oPC,OBJECT_SELF,-100);
            if (GetIsObjectValid(oGong))
            {
                if (GetDistanceToObject(oGong) > 3.0)
                {
                    ActionMoveToObject(oGong,TRUE);
                    DelayCommand(6.0,SignalEvent(OBJECT_SELF,EventUserDefined(600)));
                }
                else
                {
                    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_Alarm",10);
                }
            }
            else
            {
                ActionForceMoveToObject(GetWaypointByTag("WP_SICKEXIT"));
                ActionDoCommand(DestroyObject(OBJECT_SELF));
            }
        break;
    }
}
