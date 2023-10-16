//::///////////////////////////////////////////////
//:: Witch Wake: Ethereal Leak, PC Has Nim's Device
//:: WW_Leak_NimDev_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player carries
     Nimmermaer's Curious Device.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oNimsDevice = GetItemPossessedBy(oPC, "ww1_nimsdevice");

    if (oNimsDevice != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
