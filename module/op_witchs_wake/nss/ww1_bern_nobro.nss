//::///////////////////////////////////////////////
//:: Witch's Wake 1: Bernhardt (Player Has Not Talked to Brother)
//:: WW1_Bern_NoBro.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has not resolved
     the Johann quest.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 30, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sBrotherRests = GetLocalString(oPC, "sJohannRests");
    if (sBrotherRests == "")
    {
        return TRUE;
    }
    return FALSE;
}
