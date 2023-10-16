//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker Look at Hand Condition
//:: WW1_Ragp_Look_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has not yet looked
     at their hand.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bLookHand = GetLocalInt(oPC, "CONV_RAGPICKER_LookHand");

    if (bLookHand == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
