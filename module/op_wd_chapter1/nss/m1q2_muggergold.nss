//::///////////////////////////////////////////////
//:: Mugger's Gold
//:: m1q2_MuggerGold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This conversation action script gives the
    PC Speaker 1d6 gold and causes the NPC to
    escape area. It's used in m1q2 when the
    players have the opportunity to "mug" the
    already beleaguered commoners.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 16, 2001
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    int iGold = Random(6)+1;
    object oMugger = GetPCSpeaker();
    object oEscapeDoor = GetNearestObject(OBJECT_TYPE_DOOR);

    RewardGP(iGold, oMugger, FALSE);
    ActionForceMoveToObject(oEscapeDoor, TRUE);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
