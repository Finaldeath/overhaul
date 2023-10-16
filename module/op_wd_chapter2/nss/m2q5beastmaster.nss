//::///////////////////////////////////////////////
//:: Notice
//:: M2Q5BeastMaster
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script is a modified version of the default.
    When an enemy is noticed this creature will first
    free the creatures in the nearby cages.
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
            if (GetLocalInt(OBJECT_SELF,"NW_L_OpenDoors") == 0)
            {
                SpeakOneLinerConversation();
                SetLocalInt(OBJECT_SELF,"NW_L_OpenDoors",10);
                SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",oNoticed);
                SignalEvent(OBJECT_SELF,EventUserDefined(500));
            }
        }
        else if(GetLastPerceptionVanished() &&
                 GetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack") == oNoticed)
        {
            if (GetLocalInt(OBJECT_SELF,"NW_L_BeastsFree") == 10)
            {
                SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",OBJECT_INVALID);
                ClearAllActions();
            }
        }
    }
}
