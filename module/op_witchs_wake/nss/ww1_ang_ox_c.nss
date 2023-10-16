//::///////////////////////////////////////////////
//:: Witch Wake 1: Angmar Ox Condition
//:: WW1_Ang_Ox_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player attacked Angmar's
     ox and hasn't repaid him for it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bOx = GetLocalInt(oPC, "AngmarOxAttacked");
    int bPayment = GetLocalInt(oPC, "AngmarOxPayment");

    if (bOx == TRUE &&
        bPayment == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
