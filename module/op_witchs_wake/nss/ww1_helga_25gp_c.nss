//::///////////////////////////////////////////////
//:: Witchwork 1: Helga Einswater, 25 gp condition
//:: WW1_Helga_25gp_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has 25 gp.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 24, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iGold = GetGold(oPC);

    if (iGold < 25)
    {
        return TRUE;
    }
    return FALSE;
}
