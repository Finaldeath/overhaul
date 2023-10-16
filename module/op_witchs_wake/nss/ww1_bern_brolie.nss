//::///////////////////////////////////////////////
//:: Witch's Wake 1: Bernhardt (Player Lied to Brother)
//:: WW1_Bern_BroLie.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player resolved the
     Johann quest by telling him a lie.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 30, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sBrotherRests = GetLocalString(oPC, "sJohannRests");
    if (sBrotherRests == "No")
    {
        return TRUE;
    }
    return FALSE;
}
