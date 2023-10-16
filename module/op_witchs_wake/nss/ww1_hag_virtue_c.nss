//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag's Tarot, Virtue Condition
//:: WW1_Hag_Virtue_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Warlock's Hand local is
     set to 1 and the player is not evil.
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

    if (iWarlocksHand == 1 &&
        iAlignment != ALIGNMENT_EVIL)
    {
        return TRUE;
    }
    return FALSE;
}
