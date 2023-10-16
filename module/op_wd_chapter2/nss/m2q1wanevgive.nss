//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q1WanevGive
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Wanev gives his wardstone and take payment.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

void main()
{
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q01IWARDWANEV"),GetPCSpeaker());
    TakeGold(GetLocalInt(OBJECT_SELF,"NW_L_Payment"),GetPCSpeaker());
}
