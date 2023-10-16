//::///////////////////////////////////////////////
//:: M2Q2E_GIVERING1.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gives the ring of the fourth circle to the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 7, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    CreateItemOnObject("M2Q2E_RING1",GetPCSpeaker());
    RewardXP("m2q2_Circle",100,GetPCSpeaker());
    AddJournalQuestEntry("m2q2_Circle",30,GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LKILLED",0);
}
