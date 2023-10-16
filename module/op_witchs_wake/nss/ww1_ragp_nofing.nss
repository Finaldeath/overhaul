//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker No Finger Condition
//:: WW1_Ragp_NoFing.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player previously lost
     their finger to the Ragpicker.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bNoFinger = GetLocalInt(oPC, "CONV_RAGPICKER_Fingerless");

    if (bNoFinger == TRUE)
    {
        return TRUE;
    }
    return FALSE;

}
