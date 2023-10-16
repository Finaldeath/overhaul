//::///////////////////////////////////////////////
//:: Notice
//:: M2Q5Goblin_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script is a modified version of the default.
    When an enemy is noticed this creature will first
    run to sound the alarm.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 9, 2001
//:://////////////////////////////////////////////

void main()
{
    object oNoticed = GetLastPerceived();
    object oGong = GetNearestObjectByTag("M2Q05PGONG");
    
    if(GetIsObjectValid(oNoticed))
    {
        if (GetLastPerceptionSeen() && GetIsEnemy(oNoticed))
        {
            if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_GoblinAlarm") == 0)
            {
                if (GetIsObjectValid(oGong) && GetDistanceToObject(oGong) > 2.0)
                {
                    SetLocalObject(GetArea(OBJECT_SELF),"NW_A_Intruder",oNoticed);
                    ActionMoveToObject(oGong,TRUE);
                    ActionDoCommand(SetLocalInt(GetArea(OBJECT_SELF),"NW_A_GoblinAlarm",10));
                }
                else if (GetIsObjectValid(oGong) && GetDistanceToObject(oGong) <= 2.0)
                {
                    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_GoblinAlarm",10);
                }
            }
            else
            {
                ClearAllActions();
                SetListening(OBJECT_SELF,FALSE);
                SetLocalInt(OBJECT_SELF,"NW_L_FoundIntruder",10);
                ActionAttack(oNoticed);
                SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",oNoticed);
                //DelayCommand(3.0,SignalEvent(OBJECT_SELF,EventUserDefined(0)));
            }
        }
        else if (GetLastPerceptionVanished() &&
                GetLocalObject(GetArea(OBJECT_SELF),"NW_A_Intruder") == oNoticed)
        {
            SetLocalInt(OBJECT_SELF,"NW_L_FoundIntruder",0);
        }
        else if (GetLastPerceptionSeen() &&
                GetIsPC(oNoticed) &&
                GetLocalInt(GetArea(OBJECT_SELF),"NW_A_GoblinAlarm") == 20 &&
                GetLocalInt(OBJECT_SELF,"NW_L_AlarmOff") == 10)
        {
            ActionStartConversation(OBJECT_SELF);
        }
    }
}
