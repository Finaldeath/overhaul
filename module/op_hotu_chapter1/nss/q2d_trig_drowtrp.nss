//::///////////////////////////////////////////////
//:: Name q2d_trig_drowtrp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If one of these traps is tripped - a Drow Scout
    will come and investigate..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 26/03
//:://////////////////////////////////////////////

void main()
{

    if (GetLocalInt(GetModule(), "X2_Q2DNAlarmTriggered") == 1)
        return;

    SetLocalInt(GetModule(), "X2_Q2DNAlarmTriggered", 1);
    object oPC = GetEnteringObject();
    object oTarget = GetWaypointByTag("wp_" + GetTag(OBJECT_SELF));
    object oDrow = GetNearestObjectByTag("x2_q2drowscout1");

    SetLocalObject(oDrow, "oAlarmTarget", oTarget);
    SetLocalInt(oDrow, "nCheckingAmbush", 1);
    AssignCommand(oDrow, ActionMoveToObject(oTarget, TRUE));
}
