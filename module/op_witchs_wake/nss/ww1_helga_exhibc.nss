//::///////////////////////////////////////////////
//:: Witchwork 1: Helga Einswater, Exhibit Condition
//:: WW1_Helga_ExhibC.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has not yet paid
     for Exhibit Access.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 4, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bAccess = GetLocalInt(oPC, "CONV_HELGA_Access");

    if (bAccess == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
