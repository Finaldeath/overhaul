//::///////////////////////////////////////////////
//:: m2q3G Castle Guard Condition Script #1
//:: m2q3G_GuardC1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if he has already unlocked the
    gate for the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 31, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oGate = GetObjectByTag("m2q3G_CastleGate");

    if (GetLocked(oGate) == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
