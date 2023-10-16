//::///////////////////////////////////////////////
//:: Notice
//:: M2Q5BBearScout_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script is a modified version of the default.
    When an enemy is noticed this creature will first
    run for reinforcements.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 9, 2001
//:://////////////////////////////////////////////

void main()
{
    object oNoticed = GetLastPerceived();
    object oTarget = GetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack");
    if(GetIsObjectValid(oNoticed))
    {
        if (GetLastPerceptionSeen() &&
            GetIsEnemy(oNoticed) &&
            !GetIsObjectValid(oTarget))
        {
            if (GetLocalInt(OBJECT_SELF,"NW_L_Reinforcements") == 10)
            {
                ClearAllActions();
                //SetListening(OBJECT_SELF,FALSE);
                ActionAttack(oNoticed);
                SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",oNoticed);
            }
            else if (GetLocalInt(OBJECT_SELF,"NW_L_CallForHelp") == 0)
            {
                SpeakOneLinerConversation();
                SetLocalInt(OBJECT_SELF,"NW_L_CallForHelp",10);
                SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",oNoticed);
                SignalEvent(OBJECT_SELF,EventUserDefined(500));
            }
        }
        else if(GetLastPerceptionVanished() &&
                 GetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack") == oNoticed)
        {
            if (GetLocalInt(OBJECT_SELF,"NW_L_Reinforcements") == 10)
            {
                SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",OBJECT_INVALID);
                ClearAllActions();
            }
        }
    }
}
