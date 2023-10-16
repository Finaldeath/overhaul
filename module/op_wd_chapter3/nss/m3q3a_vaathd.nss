//::///////////////////////////////////////////////
//:: Vaath User Defined
//:: M3Q3A_VAATHD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Flee if there are less than five bandits
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 15,2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if(nUser == 1006)
    {
        int nMaxHP = GetMaxHitPoints();
        int nCurrHP = GetCurrentHitPoints();
        SpeakString("Current HP: " + IntToString(nCurrHP));

        if((nCurrHP * 2) <= nMaxHP)
        {
            SetLocalInt(OBJECT_SELF, "M3Q3_A2_Surrender", 1);
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF));
            while(GetIsObjectValid(oTarget))
            {
                if(oTarget != OBJECT_SELF)
                {
                    if(GetIsEnemy(oTarget))
                    {
                        ClearPersonalReputation(oTarget);
                        SetIsTemporaryFriend(oTarget);
                        SpeakString(GetName(oTarget) +  " Adjusted to" + IntToString(GetReputation(OBJECT_SELF, oTarget)));
                    }
                    AssignCommand(oTarget, ClearAllActions());
                    AssignCommand(oTarget, ActionAttack(OBJECT_INVALID));
                }
                oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF));
            }
            ClearAllActions();
            ActionAttack(OBJECT_INVALID);
            ActionStartConversation(OBJECT_SELF);
        }
    }
}
