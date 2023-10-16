//::///////////////////////////////////////////////
//:: Witch Wake 1: Angmar Bash Condition
//:: WW1_Ang_Bash_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player bashed Angmar's
     door and haven't repaid him for it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bBash = GetLocalInt(oPC, "AngmarBash");
    int bPayment = GetLocalInt(oPC, "AngmarDoorPayment");

    if (bBash == TRUE &&
        bPayment == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
