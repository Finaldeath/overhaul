//::///////////////////////////////////////////////
//:: M2Q2E_GIVERING2.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gives the ring of the third circle to the player
    and destroys his previous ring.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 7, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    DestroyObject(GetItemPossessedBy(GetLastSpeaker(),"M2Q2E_RING1"));
    CreateItemOnObject("M2Q2E_RING2",GetPCSpeaker());
    RewardXP("m2q2_Circle",100,GetPCSpeaker());
    AddJournalQuestEntry("m2q2_Circle",40,GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LKILLED",0);
}
