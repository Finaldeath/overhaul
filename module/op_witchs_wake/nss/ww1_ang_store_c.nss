//::///////////////////////////////////////////////
//:: Witchwork 1: Angmar, Store Condition
//:: WW1_Ang_Store_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Angmar has already pointed
     out his stock to them.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 8, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bSeeStore = GetLocalInt(oPC, "CONV_ANGMAR_SeeStore");

    if (bSeeStore == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
