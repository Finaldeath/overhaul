//::///////////////////////////////////////////////
//:: Witch's Wake: Prince's Pike, Hag has not been visited.
//:: WW1_Pike_NoHag.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has not yet
     visited the Hag.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 5, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bVisitedHag = GetLocalInt(oPC, "XP_EX_NightHagHome");

    if (bVisitedHag == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
