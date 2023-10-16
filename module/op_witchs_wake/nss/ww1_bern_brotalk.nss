//::///////////////////////////////////////////////
//:: Witch's Wake 1: Bernhardt (Player Talked to Brother)
//:: WW1_Bern_BroTalk.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player resolved the
     Johann quest one way or another.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 30, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sBrotherRests = GetLocalString(oPC, "sJohannRests");
    if (sBrotherRests == "Yes" ||
        sBrotherRests == "No")
    {
        return TRUE;
    }
    return FALSE;
}
