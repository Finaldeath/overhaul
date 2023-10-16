//::///////////////////////////////////////////////
//:: Witchwork: Climb Down (condition)
//:: WW_ClimbDown_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is at the top of
     the cliff.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 18, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bAtTop = GetLocalInt(oPC, "CemeteryClimb");

    if (bAtTop == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
