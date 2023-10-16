//::///////////////////////////////////////////////
//:: Notice
//:: M2Q5GobPriest_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script is a modified version of the default.
    When an enemy is noticed this creature will first
    speak a line of dialog.
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
            GetIsPC(oNoticed))
        {
            if (GetIsEnemy(oNoticed))
            {
           	    SetLocalInt(OBJECT_SELF,"NW_L_TempleEnemy",10);
            }
            else
            {
           	    SetLocalInt(OBJECT_SELF,"NW_L_TempleEnemy",0);
            }
            ActionStartConversation(OBJECT_SELF);
        }

        if (GetLastPerceptionSeen() &&
            GetIsEnemy(oNoticed) &&
            !GetIsObjectValid(oTarget))
        {
            ClearAllActions();
            ActionStartConversation(OBJECT_SELF);
            DelayCommand(1.0,ActionAttack(oNoticed));
            SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",oNoticed);
        }
        else if(GetLastPerceptionVanished() &&
                 GetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack") == oNoticed)
        {
            SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",OBJECT_INVALID);
            ClearAllActions();
        }
    }
}
