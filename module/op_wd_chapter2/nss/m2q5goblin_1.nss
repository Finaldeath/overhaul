//::///////////////////////////////////////////////
//:: Heartbeat
//:: M2Q5Goblin_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script has the creature move toward the intruder
    when the alarm is sounded.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 9, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_GoblinAlarm") == 10 &&
        GetLocalInt(OBJECT_SELF,"NW_L_FoundIntruder") == 0 &&
        GetDistanceToObject(GetLocalObject(GetArea(OBJECT_SELF),"NW_A_Intruder")) > 3.0)
    {
        ActionMoveToObject(GetLocalObject(GetArea(OBJECT_SELF),"NW_A_Intruder"),TRUE);
    }
    else if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_GoblinAlarm") == 20 &&
            GetLocalInt(OBJECT_SELF,"NW_L_AlarmOff") == 0)
    {
        ClearAllActions();
        SetLocalInt(OBJECT_SELF,"NW_L_AlarmOff",10);
        SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",OBJECT_INVALID);
    }
}
