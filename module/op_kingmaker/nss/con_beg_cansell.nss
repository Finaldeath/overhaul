//::///////////////////////////////////////////////
//:: Can Sell Fish
//:: con_beg_cansell
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has fish to sell to the beggar
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include"
int StartingConditional()
{
    int iResult = FALSE;
    object oPC = GetFirstPC();
    object oFish = GetItemPossessedBy(oPC,"q2c_itm_fish");
    int iGaveFish = GetLocalInt(OBJECT_SELF, "OS_BEGGAR_FISH");

    if((GetIsObjectValid(oFish) == TRUE) && (iGaveFish < 15))
    {
        iResult = TRUE;
    }

    return iResult;
}
