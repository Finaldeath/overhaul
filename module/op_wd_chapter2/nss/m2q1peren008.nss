//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1Peren008
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Peren gives the PC his journal.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    GiveGoldToCreature(GetPCSpeaker(),GetGold());
    ActionMoveAwayFromObject(GetPCSpeaker(),TRUE);
    DelayCommand(5.0,DestroyObject(OBJECT_SELF));
}
