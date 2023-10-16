//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag's Tarot, Anger Condition
//:: WW1_Hag_Anger_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Warlock's Hand local is
     set to 3 and the player is not good.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iWarlocksHand = GetLocalInt(oPC, "iWarlocksHand");
    int iAlignment = GetAlignmentGoodEvil(oPC);

    if (iWarlocksHand == 3 &&
        iAlignment != ALIGNMENT_GOOD)
    {
        return TRUE;
    }
    return FALSE;
}
