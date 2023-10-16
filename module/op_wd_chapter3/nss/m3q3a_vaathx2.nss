//::///////////////////////////////////////////////
//:: Vaath Give Scroll, Gold x2 and Escape
//:: M3Q3A_VAATHX2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Reward Player with the Scroll, Goldx2.
    Move remaing bandits out of the area
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 15, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

void main()
{
    int nGold = 2 * GetLocalInt(OBJECT_SELF, "M3Q3_A2_Gold");
    SpeakString(IntToString(nGold));
    RewardGP(nGold, GetPCSpeaker());

    object oItem = GetItemPossessedBy(OBJECT_SELF, "M3ALL_MAGSCROLL");
    if(GetIsObjectValid(oItem))
    {
        ActionGiveItem(oItem, GetPCSpeaker());
    }

    EscapeArea();
/*    object oWayEscape = GetWaypointByTag("M3Q3A_VAATH_ESCAPE");
    object oRaider = GetFirstFactionMember(OBJECT_SELF, FALSE);
    while(GetIsObjectValid(oRaider))
    {
        AssignCommand(oRaider, ClearAllActions());
        AssignCommand(oRaider, ActionMoveToObject(oWayEscape));
        AssignCommand(oRaider, DestroyObject(oRaider, 1.0));
        oRaider = GetNextFactionMember(OBJECT_SELF, FALSE);
    }
    ClearAllActions();
    ActionMoveToObject(oWayEscape);
    AssignCommand(oRaider, DestroyObject(oRaider, 1.0));          */
}

