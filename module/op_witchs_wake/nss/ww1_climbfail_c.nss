//::///////////////////////////////////////////////
//:: Witchwork 1: Rock Climb Failed (Condition)
//:: WW1_ClimbFail_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player failed to climb
     the rock in the Night Hag's Cemetery.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bFailed = GetLocalInt(oPC, "bRockClimbFailed");

    if (bFailed == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
