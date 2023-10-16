//::///////////////////////////////////////////////
//:: Vaath Give Scroll, Gold and Escape
//:: M3Q3A_VAATHX1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Reward Player with the Scroll, Gold.
    Move remaing bandits out of the area
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 15, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

void main()
{
    int nGold = GetLocalInt(OBJECT_SELF, "M3Q3_A2_Gold");
    RewardGP(nGold, GetPCSpeaker());
    RewardXP("M3Q1_A07_BANDIT_PLOT",25,GetPCSpeaker());

    EscapeViaTeleport(OBJECT_SELF);
  /*  object oWayEscape = GetWaypointByTag("M3Q3A_VAATH_ESCAPE");
    object oRaider = GetFirstFactionMember(OBJECT_SELF, FALSE);
    while(GetIsObjectValid(oRaider))
    {
        AssignCommand(oRaider, ClearAllActions());
        AssignCommand(oRaider, ActionForceMoveToObject(oWayEscape));
        AssignCommand(oRaider, DestroyObject(oRaider, 1.0));
        GetNextFactionMember(OBJECT_SELF, FALSE);
    }
    ClearAllActions();
    ActionForceMoveToObject(oWayEscape);
    AssignCommand(oRaider, DestroyObject(oRaider, 1.0));
    */
}
