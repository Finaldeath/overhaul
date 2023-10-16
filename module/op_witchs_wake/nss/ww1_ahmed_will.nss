//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed Will Save Check
//:: WW1_Ahmed_Will
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player makes a successful
     Will Save.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 27, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bWillSave = WillSave(oPC, 11);

    if (bWillSave == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
