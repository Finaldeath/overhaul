//::///////////////////////////////////////////////
//:: Sir William Rey (Player Doesn't Know of Winds)
//:: C_William_3Winds.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if the player has not yet learned
     of the Winds.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: May 20, 2003
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
