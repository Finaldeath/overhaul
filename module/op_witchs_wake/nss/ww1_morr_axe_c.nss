//::///////////////////////////////////////////////
//:: Witchwork 1: Morrius, Player has Witchbane
//:: WW1_Morr_Axe_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is carrying the
     axe, Witchbane, acquired from Morrius'
     corpse in the dawn area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 15, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iWitchbaneDiscussed = GetLocalInt(oPC, "CONV_MORR_WitchbaneEnd");
    object oWitchbane = GetItemPossessedBy(oPC, "ww1_Witchbane");

    if (oWitchbane != OBJECT_INVALID &&
        iWitchbaneDiscussed == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
