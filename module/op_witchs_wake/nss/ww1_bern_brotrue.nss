//::///////////////////////////////////////////////
//:: Witch's Wake 1: Bernhardt (Player Told Brother the Truth)
//:: WW1_Bern_BroTrue.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player resolved the
     Johann quest by telling him the truth.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 30, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sBrotherRests = GetLocalString(oPC, "sJohannRests");
    if (sBrotherRests == "Yes")
    {
        return TRUE;
    }
    return FALSE;
}
