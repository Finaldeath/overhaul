//::///////////////////////////////////////////////
//:: William / Karsus (Condition - Winds Knowledge)
//:: C_William_Wind_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player has learned of the Three Winds.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 28, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bWinds = GetLocalInt(oPC, "bThreeWinds");

    if (bWinds == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
