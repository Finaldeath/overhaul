//::///////////////////////////////////////////////
//:: Conversation
//:: m1s4GiveBar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Claudus gives the bar to the champion and leaves.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 30, 2001
//:://////////////////////////////////////////////

#include "NW_I0_Plot"
void main()
{
    SetLocalObject(GetModule(),"NW_G_M1S4BarOwner",GetPCSpeaker());
    SetCustomToken(710,GetName(GetPCSpeaker()));
    ActionMoveToObject(GetNearestObjectByTag("WP_M1S4BExit"));
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
    if(GetLocalInt(OBJECT_SELF,"NW_L_XPGiven") == FALSE)
    {
        RewardXP("m1q1_Arena",100,GetPCSpeaker());
        SetLocalInt(OBJECT_SELF,"NW_L_XPGiven",TRUE);
    }
}
