//::///////////////////////////////////////////////
//:: Witchwork 1: Elkentree, Player Knows Angmar's Secret
//:: WW1_Elkentree_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player knows Angmar's
     secret.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 13, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bSecret = GetLocalInt(oPC, "CONV_ANGMAR_Secret");

    if (bSecret == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
