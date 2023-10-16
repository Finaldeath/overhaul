//::///////////////////////////////////////////////
//::M4Catapult.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Each catapult that is destroyed will increment the catapults destroyed global

*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  January 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    int nOld = GetLocalInt(GetModule(), "NW_G_M4Q01_CATAPULTS");
    SetLocalInt(GetModule(),"NW_G_M4Q01_CATAPULTS", nOld + 1);
    object oKiller = GetLastKiller();
    RewardXP("M4Q01_SIEGE",16,oKiller);
    if (nOld == 3)
    {
        AddJournalQuestEntry("M4Q01_SIEGE",25,oKiller);
    }
}
